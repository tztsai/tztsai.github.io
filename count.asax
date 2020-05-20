<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // 在应用程序启动时运行的代码
        int count = 0;
        StreamReader sdr;
        // 获取文件路径
        string filePath = Server.MapPath("count.txt");
        // 打开文件
        sdr = File.OpenText(filePath);
        // 读取文件
        while (sdr.Peek() != -1)
        {
            string str = sdr.ReadLine();
            // 把字符串强制类型转换成整型数据
            count = int.Parse(str);
        }
        sdr.Close();
        object objcount = count;
        Application["onlinecount"] = count;
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  在应用程序关闭时运行的代码
        int Oncount = 0;
        Oncount = (int)Application["onlinecount"];
        string filepath = Server.MapPath("count");
        StreamWriter swr = new StreamWriter(filepath, false);
        swr.WriteLine(Oncount);
        swr.Close();
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 在出现未处理的错误时运行的代码
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // 在新会话启动时运行的代码
        Application.Lock();
        int Oncount = 0;
        Oncount = (int)Application["onlinecount"];
        Oncount += 1;
        object Onobj = Oncount;
        Application["onlinecount"] = Onobj;

        //将数据记录回到文件中
        string filepath = Server.MapPath("count.txt");
        StreamWriter swr = new StreamWriter(filepath, false);
        swr.WriteLine(Oncount);
        swr.Close();
        Application.UnLock();
    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。
    }
       
</script>