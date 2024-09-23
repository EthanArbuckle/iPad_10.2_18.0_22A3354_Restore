@implementation BKTouchContact

- (BKTouchContact)init
{
  BKTouchContact *v2;
  NSMutableSet *v3;
  NSMutableSet *destinations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKTouchContact;
  v2 = -[BKTouchContact init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    destinations = v2->_destinations;
    v2->_destinations = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingChain, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_hitTestSecurityAnalysis, 0);
  objc_storeStrong((id *)&self->_hitTestInformationAtDown, 0);
  objc_storeStrong((id *)&self->_routingPolicy, 0);
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_pathIndex));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  BOOL v10;

  v5 = objc_opt_class(BKTouchContact, a2, a3);
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
    v10 = v9[1] == self->_pathIndex;
  else
    v10 = 0;

  return v10;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5;
  id v6;
  unint64_t presence;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  uint64_t v11;
  uint64_t userIdentifier;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableSet *destinations;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = objc_msgSend(a3, "appendInteger:withName:", self->_pathIndex, CFSTR("pathIndex"));
  v6 = objc_msgSend(a3, "appendInteger:withName:", self->_touchIdentifier, CFSTR("touchIdentifier"));
  presence = self->_presence;
  if (presence > 2)
    v8 = CFSTR("<unknown>");
  else
    v8 = *(&off_1000EC8A0 + presence);
  objc_msgSend(a3, "appendString:withName:", v8, 0);
  v9 = CFSTR("startAvoiding");
  switch(self->_hitTestPolicy)
  {
    case 0:
      goto LABEL_10;
    case 1:
      goto LABEL_9;
    case 2:
      v9 = CFSTR("avoid");
      goto LABEL_9;
    case 3:
      v9 = CFSTR("avoidThenReset");
      goto LABEL_9;
    case 4:
      v9 = CFSTR("locked");
      goto LABEL_9;
    default:
      v9 = CFSTR("<unknown>");
LABEL_9:
      objc_msgSend(a3, "appendString:withName:", v9, 0);
LABEL_10:
      v10 = objc_msgSend(a3, "appendBool:withName:ifEqualTo:", self->_touchDetached, CFSTR("detached"), 1);
      userIdentifier = self->_userIdentifier;
      if ((_DWORD)userIdentifier)
        v13 = objc_msgSend(a3, "appendUInt64:withName:format:", userIdentifier, CFSTR("userIdentifier"), 1);
      v14 = objc_opt_class(BSDescriptionStream, v11);
      v15 = a3;
      v16 = v15;
      if (v14)
      {
        if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      v20 = v17;

      v18 = v20;
      if (v20)
      {
        destinations = self->_destinations;
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000884D4;
        v21[3] = &unk_1000EC880;
        v22 = v20;
        objc_msgSend(v22, "appendCollection:withName:itemBlock:", destinations, CFSTR("destinations"), v21);

        v18 = v20;
      }

      return;
  }
}

@end
