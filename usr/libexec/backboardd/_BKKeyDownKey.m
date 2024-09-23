@implementation _BKKeyDownKey

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  v2 = self->_page ^ self->_senderID ^ self->_usage;
  v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v2 ^ (v2 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v2 ^ (v2 >> 30))) >> 27));
  return v3 ^ (v3 >> 31);
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
  v7 = objc_opt_class(_BKKeyDownKey, v5, v6);
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

  v12 = v11 && self->_senderID == v11[1] && self->_page == v11[2] && self->_usage == v11[3];
  return v12;
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
  _BKKeyDownKey *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004D234;
  v5[3] = &unk_1000ECD80;
  v6 = a3;
  v7 = self;
  v4 = v6;
  objc_msgSend(v4, "appendProem:block:", 0, v5);

}

@end
