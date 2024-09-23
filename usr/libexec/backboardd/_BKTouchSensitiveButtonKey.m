@implementation _BKTouchSensitiveButtonKey

- (unint64_t)hash
{
  return self->_usage;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  BOOL v12;

  v4 = a3;
  v7 = objc_opt_class(_BKTouchSensitiveButtonKey, v5, v6);
  v8 = v4;
  v9 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = v11
     && self->_senderID == v11[2]
     && self->_page == *((unsigned __int16 *)v11 + 4)
     && self->_usage == *((unsigned __int16 *)v11 + 5);

  return v12;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100037774;
  v4[3] = &unk_1000ECD80;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  objc_msgSend(v3, "appendProem:block:", 0, v4);

}

@end
