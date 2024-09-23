@implementation CarFocusOrderEnvironment

+ (CarFocusOrderEnvironment)environmentWithFocusEnvironment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setFocusEnvironment:", v4);

  objc_msgSend(v5, "setRepresentativeItemTypeNumber:", &off_1012700A8);
  return (CarFocusOrderEnvironment *)v5;
}

+ (CarFocusOrderEnvironment)environmentWithRepresentativeItemType:(unint64_t)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v4, "setRepresentativeItemTypeNumber:", v5);

  return (CarFocusOrderEnvironment *)v4;
}

- (unint64_t)representativeItemType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusOrderEnvironment representativeItemTypeNumber](self, "representativeItemTypeNumber"));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)ifFocusEnvironment:(id)a3 ifRepresentativeItem:(id)a4
{
  _QWORD *v6;
  void (*v7)(void);
  _QWORD *v8;

  v8 = a3;
  v6 = a4;
  if (self->_focusEnvironment)
  {
    v7 = (void (*)(void))v8[2];
LABEL_5:
    v7();
    goto LABEL_6;
  }
  if (self->_representativeItemTypeNumber)
  {
    -[CarFocusOrderEnvironment representativeItemType](self, "representativeItemType");
    v7 = (void (*)(void))v6[2];
    goto LABEL_5;
  }
LABEL_6:

}

- (UIFocusEnvironment)focusEnvironment
{
  return self->_focusEnvironment;
}

- (void)setFocusEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_focusEnvironment, a3);
}

- (NSNumber)representativeItemTypeNumber
{
  return self->_representativeItemTypeNumber;
}

- (void)setRepresentativeItemTypeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_representativeItemTypeNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeItemTypeNumber, 0);
  objc_storeStrong((id *)&self->_focusEnvironment, 0);
}

@end
