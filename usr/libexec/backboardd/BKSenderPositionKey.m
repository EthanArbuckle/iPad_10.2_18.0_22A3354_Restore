@implementation BKSenderPositionKey

- (unint64_t)hash
{
  return self->_positionID;
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
  v7 = objc_opt_class(BKSenderPositionKey, v5, v6);
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

  v12 = v11 && self->_senderID == v11[1] && self->_positionID == v11[2];
  return v12;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = objc_msgSend(v6, "appendUInt64:withName:format:", self->_senderID, CFSTR("senderID"), 1);
  v5 = objc_msgSend(v6, "appendInteger:withName:", self->_positionID, CFSTR("positionID"));

}

@end
