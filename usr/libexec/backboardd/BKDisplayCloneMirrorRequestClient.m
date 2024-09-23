@implementation BKDisplayCloneMirrorRequestClient

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004556C;
  v4[3] = &unk_1000ECD80;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  objc_msgSend(v3, "appendProem:block:", 0, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

@end
