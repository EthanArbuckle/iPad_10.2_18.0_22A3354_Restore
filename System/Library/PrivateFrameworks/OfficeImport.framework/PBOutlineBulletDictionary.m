@implementation PBOutlineBulletDictionary

- (id)initFromContainer:(id)a3 objectType:(unsigned int)a4
{
  id v6;
  PBOutlineBulletDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mDictionary;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  PBOutlineBulletKey *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PBOutlineBulletDictionary;
  v7 = -[PBOutlineBulletDictionary init](&v18, sel_init);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mDictionary = v7->mDictionary;
    v7->mDictionary = v8;

    v10 = objc_msgSend(v6, "childCount");
    if (v10 >= 2)
    {
      v11 = 1;
      do
      {
        objc_msgSend(v6, "childAt:", v11 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "childAt:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "eshObject");
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14) == 4015)
        {
          v15 = objc_msgSend(v13, "eshObject");
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15) == a4)
          {
            v16 = -[PBOutlineBulletKey initWithOutlineBullet:]([PBOutlineBulletKey alloc], "initWithOutlineBullet:", v12);
            if (v16)
              -[NSMutableDictionary setObject:forKey:](v7->mDictionary, "setObject:forKey:", v13, v16);

          }
        }

        v11 += 2;
      }
      while (v11 < v10);
    }
  }

  return v7;
}

- (id)objectForSlideId:(unsigned int)a3 textType:(int)a4 placeholderIndex:(unsigned int)a5
{
  PBOutlineBulletKey *v6;
  void *v7;

  v6 = -[PBOutlineBulletKey initWithSlideId:textType:placeholderIndex:]([PBOutlineBulletKey alloc], "initWithSlideId:textType:placeholderIndex:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  -[NSMutableDictionary objectForKey:](self->mDictionary, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDictionary, 0);
}

@end
