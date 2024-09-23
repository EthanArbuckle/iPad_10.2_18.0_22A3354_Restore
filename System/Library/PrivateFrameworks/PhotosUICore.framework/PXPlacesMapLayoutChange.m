@implementation PXPlacesMapLayoutChange

- (PXPlacesMapLayoutChange)initWithSourceLayoutItem:(id)a3 targetLayoutItem:(id)a4 type:(int64_t)a5
{
  id v9;
  id v10;
  PXPlacesMapLayoutChange *v11;
  PXPlacesMapLayoutChange *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXPlacesMapLayoutChange;
  v11 = -[PXPlacesMapLayoutChange init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceLayoutItem, a3);
    objc_storeStrong((id *)&v12->_targetLayoutItem, a4);
    v12->_type = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapLayoutChange;
  -[PXPlacesMapLayoutChange description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PXPlacesMapLayoutChange type](self, "type");
  if (v6 > 2)
    v7 = CFSTR("UNKNOWN");
  else
    v7 = off_1E5144050[v6];
  objc_msgSend(v5, "appendFormat:", CFSTR("TYPE:\t%@\n"), v7);
  -[PXPlacesMapLayoutChange sourceLayoutItem](self, "sourceLayoutItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("SOURCE:\t%@\n"), v8);

  -[PXPlacesMapLayoutChange targetLayoutItem](self, "targetLayoutItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("TARGET:\t%@\n"), v9);

  return v5;
}

- (PXPlacesMapLayoutItem)sourceLayoutItem
{
  return self->_sourceLayoutItem;
}

- (PXPlacesMapLayoutItem)targetLayoutItem
{
  return self->_targetLayoutItem;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLayoutItem, 0);
  objc_storeStrong((id *)&self->_sourceLayoutItem, 0);
}

@end
