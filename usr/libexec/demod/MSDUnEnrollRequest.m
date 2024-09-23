@implementation MSDUnEnrollRequest

- (MSDUnEnrollRequest)init
{
  MSDUnEnrollRequest *v2;
  MSDUnEnrollRequest *v3;
  MSDUnEnrollRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDUnEnrollRequest;
  v2 = -[MSDUnEnrollRequest init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDUnEnrollRequest setObliterate:](v2, "setObliterate:", 0);
    v4 = v3;
  }

  return v3;
}

- (id)getPostData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDUnEnrollRequest obliterate](self, "obliterate")));
  v8[0] = CFSTR("UniqueDeviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v8[1] = CFSTR("ObliterateDevice");
  v9[0] = v4;
  v9[1] = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "convertToNSData"));
  return v6;
}

- (BOOL)obliterate
{
  return self->_obliterate;
}

- (void)setObliterate:(BOOL)a3
{
  self->_obliterate = a3;
}

@end
