@implementation BKKeyboardInfo

- (void)dealloc
{
  __GSKeyboard *gsKeyboard;
  objc_super v4;

  gsKeyboard = self->_gsKeyboard;
  if (gsKeyboard)
    GSKeyboardRelease(gsKeyboard, a2);
  v4.receiver = self;
  v4.super_class = (Class)BKKeyboardInfo;
  -[BKKeyboardInfo dealloc](&v4, "dealloc");
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  BKKeyboardInfo *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100078B60;
  v5[3] = &unk_1000ECD80;
  v6 = a3;
  v7 = self;
  v4 = v6;
  objc_msgSend(v4, "appendProem:block:", self, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualDeviceID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_keyboardActivationEventDescriptor, 0);
  objc_storeStrong((id *)&self->_eventRecognizer, 0);
  objc_storeStrong((id *)&self->_exclusivityIdentifier, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
