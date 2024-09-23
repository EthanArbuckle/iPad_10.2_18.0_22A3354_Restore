@implementation CRDNDEndAlert

- (CRDNDEndAlert)initWithText:(id)a3
{
  id v5;
  CRDNDEndAlert *v6;
  CRDNDEndAlert *v7;

  v5 = a3;
  v6 = -[CRBulletin init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalText, a3);

  return v7;
}

- (id)title
{
  return CFSTR("[Internal] Do Not Disturb ended");
}

- (id)message
{
  return -[CRDNDEndAlert internalText](self, "internalText");
}

+ (id)actions
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CARDNDDiagnosticsService TTRURLforEvent:](CARDNDDiagnosticsService, "TTRURLforEvent:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRBulletin CARActionWithURL:title:](CRBulletin, "CARActionWithURL:title:", v2, CFSTR("[Internal] File Radar")));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (NSString)internalText
{
  return self->_internalText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalText, 0);
}

@end
