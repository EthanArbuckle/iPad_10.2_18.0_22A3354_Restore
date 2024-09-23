@implementation BKMouseDestination

- (id)copyWithZone:(_NSZone *)a3
{
  CGPoint *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKMouseDestination;
  v4 = -[BKCAContextDestination copyWithZone:](&v6, "copyWithZone:", a3);
  sub_1000260C0((uint64_t)v4, self->_displayUUID);
  sub_1000260D8((uint64_t)v4, self->_senderInfo);
  if (v4)
    v4[5] = self->_hitTestPoint;
  return v4;
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  BKMouseDestination *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026010;
  v5[3] = &unk_1000ECD80;
  v6 = a3;
  v7 = self;
  v4 = v6;
  objc_msgSend(v4, "appendProem:block:", 0, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_hitTestSecurityAnalysis, 0);
  objc_storeStrong((id *)&self->_hitTestInformationAtButtonDown, 0);
  objc_storeStrong((id *)&self->_senderInfo, 0);
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

@end
