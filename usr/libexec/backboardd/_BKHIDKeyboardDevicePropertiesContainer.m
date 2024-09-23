@implementation _BKHIDKeyboardDevicePropertiesContainer

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027544;
  block[3] = &unk_1000EBC38;
  block[4] = a1;
  if (qword_100117248 != -1)
    dispatch_once(&qword_100117248, block);
  return (id)qword_100117240;
}

- (NSArray)props
{
  return self->_props;
}

- (void)setProps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_props, 0);
}

@end
