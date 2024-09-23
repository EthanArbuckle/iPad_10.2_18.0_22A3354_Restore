@implementation MSDAckRequest

- (id)getPostData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("UniqueDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v8[1] = CFSTR("Result");
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDAckRequest status](self, "status")));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "convertToNSData"));
  return v6;
}

- (BOOL)status
{
  return self->_status;
}

- (void)setStatus:(BOOL)a3
{
  self->_status = a3;
}

@end
