@implementation RAPAuxiliaryControlCarPlay

- (RAPAuxiliaryControlCarPlay)initWithInformationFromDevice:(id)a3 accessory:(id)a4 displayController:(id)a5
{
  id v8;
  id v9;
  RAPAuxiliaryControlCarPlay *v10;
  RAPAuxiliaryControlCarPlay *v11;
  void *v12;
  NSString *v13;
  NSString *ID;
  void *v15;
  GEORPCarPlayAuxiliaryControl *v16;
  GEORPCarPlayAuxiliaryControl *reportAProblemControlMessage;
  objc_super v19;

  v8 = a3;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RAPAuxiliaryControlCarPlay;
  v10 = -[RAPAuxiliaryControlCarPlay init](&v19, "init");
  if (!v10)
    goto LABEL_6;
  v11 = 0;
  if (v8 && a4 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ID"));
    v13 = (NSString *)objc_msgSend(v12, "copy");
    ID = v10->_ID;
    v10->_ID = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectedCarMainScreenInfo"));
    v16 = (GEORPCarPlayAuxiliaryControl *)objc_alloc_init((Class)GEORPCarPlayAuxiliaryControl);
    reportAProblemControlMessage = v10->_reportAProblemControlMessage;
    v10->_reportAProblemControlMessage = v16;

    -[GEORPCarPlayAuxiliaryControl setCarInfo:](v10->_reportAProblemControlMessage, "setCarInfo:", v15);
LABEL_6:
    v11 = v10;
  }

  return v11;
}

- (BOOL)isSameControlAsControl:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = objc_opt_class(RAPAuxiliaryControlCarPlay);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
    v8 = -[NSString isEqual:](self->_ID, "isEqual:", v7[1]);
  else
    v8 = 0;

  return v8;
}

- (GEORPCarPlayAuxiliaryControl)reportAProblemControlMessage
{
  return self->_reportAProblemControlMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportAProblemControlMessage, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
