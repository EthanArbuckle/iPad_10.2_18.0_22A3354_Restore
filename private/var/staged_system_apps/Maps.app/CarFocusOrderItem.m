@implementation CarFocusOrderItem

+ (CarFocusOrderItem)itemWithFocusItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setFocusItem:", v4);

  objc_msgSend(v5, "setRepresentativeItemTypeNumber:", &off_1012700A8);
  return (CarFocusOrderItem *)v5;
}

+ (CarFocusOrderItem)itemWithRepresentativeItemType:(unint64_t)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v4, "setRepresentativeItemTypeNumber:", v5);

  return (CarFocusOrderItem *)v4;
}

- (unint64_t)representativeItemType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusOrderItem representativeItemTypeNumber](self, "representativeItemTypeNumber"));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (id)itemFlippedForRHD
{
  -[CarFocusOrderItem setFlipForRHD:](self, "setFlipForRHD:", 1);
  return self;
}

- (BOOL)flipForRHD
{
  void *v2;
  unsigned __int8 v3;

  if (!self->_flipForRHD)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v3 = objc_msgSend(v2, "rightHandDrive");

  return v3;
}

- (void)ifFocusItem:(id)a3 ifRepresentativeItem:(id)a4
{
  _QWORD *v6;
  void (*v7)(void);
  _QWORD *v8;

  v8 = a3;
  v6 = a4;
  if (self->_focusItem)
  {
    v7 = (void (*)(void))v8[2];
LABEL_5:
    v7();
    goto LABEL_6;
  }
  if (self->_representativeItemTypeNumber)
  {
    -[CarFocusOrderItem representativeItemType](self, "representativeItemType");
    v7 = (void (*)(void))v6[2];
    goto LABEL_5;
  }
LABEL_6:

}

- (UIFocusItem)focusItem
{
  return self->_focusItem;
}

- (void)setFocusItem:(id)a3
{
  objc_storeStrong((id *)&self->_focusItem, a3);
}

- (void)setFlipForRHD:(BOOL)a3
{
  self->_flipForRHD = a3;
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
  objc_storeStrong((id *)&self->_focusItem, 0);
}

@end
