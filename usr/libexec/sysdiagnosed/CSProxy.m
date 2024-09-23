@implementation CSProxy

- (CSProxy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSProxy;
  return -[CSProxy init](&v3, "init");
}

+ (BOOL)isHost
{
  __assert_rtn("+[CSProxy isHost]", "CSProxy.m", 19, "0 && \"Error: must subclass CSProxy\");
}

+ (id)description
{
  __assert_rtn("+[CSProxy description]", "CSProxy.m", 23, "0 && \"Error: must subclass CSProxy\");
}

+ (id)getProxiesForDiagnosticID:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("+[CSProxy getProxiesForDiagnosticID:]", "CSProxy.m", 27, "0 && \"Error: must subclass CSProxy\");
}

+ (void)initRemoteServers
{
  __assert_rtn("+[CSProxy initRemoteServers]", "CSProxy.m", 31, "0 && \"Error: must subclass CSProxy\");
}

- (void)cancelConnection
{
  __assert_rtn("-[CSProxy cancelConnection]", "CSProxy.m", 35, "0 && \"Error: must subclass CSProxy\");
}

- (BOOL)triggerCoSysdiagnoseWithParams:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSProxy triggerCoSysdiagnoseWithParams:]", "CSProxy.m", 39, "0 && \"Error: must subclass CSProxy\");
}

- (void)waitToReceiveCoSysdiagnose
{
  __assert_rtn("-[CSProxy waitToReceiveCoSysdiagnose]", "CSProxy.m", 43, "0 && \"Error: must subclass CSProxy\");
}

- (void)transferFileToHost:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSProxy transferFileToHost:]", "CSProxy.m", 47, "0 && \"Error: must subclass CSProxy\");
}

- (unint64_t)getTimeoutSec
{
  __assert_rtn("-[CSProxy getTimeoutSec]", "CSProxy.m", 51, "0 && \"Error: must subclass CSProxy\");
}

- (NSString)diagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDiagnosticID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticID, 0);
}

@end
