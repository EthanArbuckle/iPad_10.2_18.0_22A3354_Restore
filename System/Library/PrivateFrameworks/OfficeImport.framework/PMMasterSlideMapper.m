@implementation PMMasterSlideMapper

- (PMMasterSlideMapper)initWithPDSlide:(id)a3 parent:(id)a4
{
  id v7;
  PMMasterSlideMapper *v8;
  PMMasterSlideMapper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMMasterSlideMapper;
  v8 = -[CMMapper initWithParent:](&v11, sel_initWithParent_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_slide, a3);

  return v9;
}

- (void)mapMasterGraphicsAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PMDrawableMapper *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[PDSlideBase drawables](self->_slide, "drawables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v8, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      break;
    if ((objc_msgSend(v9, "hidden") & 1) == 0)
    {
      objc_msgSend(v10, "clientData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11 || (objc_msgSend(v11, "hasPlaceholder") & 1) == 0)
      {
        v13 = -[CMDrawableMapper initWithOadDrawable:parent:]([PMDrawableMapper alloc], "initWithOadDrawable:parent:", v10, self);
        -[PMDrawableMapper mapAt:withState:](v13, "mapAt:withState:", v14, v6);

      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slide, 0);
}

@end
