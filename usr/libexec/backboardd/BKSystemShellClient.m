@implementation BKSystemShellClient

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStyle debugStyle](BSDescriptionStyle, "debugStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSDescriptionStream descriptionForRootObject:withStyle:](BSDescriptionStream, "descriptionForRootObject:withStyle:", self, v3));

  return (NSString *)v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  unsigned int v5;
  char v6;
  BKSystemShellClient *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BKSystemShellClient *v11;
  _QWORD v12[4];
  id v13;
  BKSystemShellClient *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "hasSuccinctStyle");
  v6 = v5;
  if (v5)
    v7 = 0;
  else
    v7 = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000741A4;
  v12[3] = &unk_1000ECD80;
  v13 = v4;
  v14 = self;
  v8 = v13;
  objc_msgSend(v13, "appendProem:block:", v7, v12);
  if ((v6 & 1) == 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000741D0;
    v9[3] = &unk_1000ECD80;
    v10 = v8;
    v11 = self;
    objc_msgSend(v10, "appendBodySectionWithName:block:", 0, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectDate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
