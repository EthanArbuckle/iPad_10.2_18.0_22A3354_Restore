@implementation SKProgress

- (void)setLocalizedAdditionalDescription:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = (void *)MEMORY[0x24BDD14A8];
  v5 = a3;
  objc_msgSend(v4, "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SKProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v7, *MEMORY[0x24BDD19E8]);
  v8.receiver = self;
  v8.super_class = (Class)SKProgress;
  -[SKProgress setLocalizedAdditionalDescription:](&v8, sel_setLocalizedAdditionalDescription_, v7);

}

+ (SKProgress)progressWithTotalUnitCount:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTotalUnitCount:", a3);
  return (SKProgress *)v4;
}

- (SKProgress)init
{
  SKProgress *v2;
  SKProgress *v3;
  uint64_t v4;
  NSMutableArray *children;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKProgress;
  v2 = -[SKProgress init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SKProgress set_adoptChildUserInfo:](v2, "set_adoptChildUserInfo:", 1);
    -[SKProgress setLocalizedAdditionalDescription:](v3, "setLocalizedAdditionalDescription:", &stru_24FDC08E8);
    v4 = objc_opt_new();
    children = v3->_children;
    v3->_children = (NSMutableArray *)v4;

  }
  return v3;
}

- (void)chainChildProgress:(id)a3 withPendingUnitCount:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[SKProgress addChild:withPendingUnitCount:](self, "addChild:withPendingUnitCount:", v6, a4);
  -[SKProgress children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  objc_msgSend(v6, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x24BDD19E8], 0, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  void *v8;
  id v9;

  v7 = *MEMORY[0x24BDD19E8];
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BDD19E8], a4, a5, a6))
  {
    -[SKProgress userInfo](self, "userInfo");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKProgress setLocalizedAdditionalDescription:](self, "setLocalizedAdditionalDescription:", v8);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  -[SKProgress children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__SKProgress_dealloc__block_invoke;
  v5[3] = &unk_24FDBFA80;
  v5[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  v4.receiver = self;
  v4.super_class = (Class)SKProgress;
  -[SKProgress dealloc](&v4, sel_dealloc);
}

void __21__SKProgress_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "userInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDD19E8]);

}

- (NSMutableArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
