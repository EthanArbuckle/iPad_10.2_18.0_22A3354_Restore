@implementation BCAugmentedExperienceRegistry

+ (id)sharedRegistry
{
  if (qword_30DB38 != -1)
    dispatch_once(&qword_30DB38, &stru_28EDC0);
  return (id)qword_30DB30;
}

- (BCAugmentedExperienceRegistry)init
{
  BCAugmentedExperienceRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *presenters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCAugmentedExperienceRegistry;
  v2 = -[BCAugmentedExperienceRegistry init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    presenters = v2->_presenters;
    v2->_presenters = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerPresenterClass:(Class)a3 forExperienceType:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceRegistry presenters](self, "presenters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  objc_msgSend(v7, "setObject:forKey:", a3, v6);

}

- (id)presenterForExperienceType:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAugmentedExperienceRegistry presenters](self, "presenters"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (objc_class *)objc_msgSend(v4, "objectForKey:", v5);

  if (v6)
  {
    v7 = objc_alloc_init(v6);
    if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___BCAugmentedExperiencePresenting))
      v8 = v7;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSMutableDictionary)presenters
{
  return self->_presenters;
}

- (void)setPresenters:(id)a3
{
  objc_storeStrong((id *)&self->_presenters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenters, 0);
}

@end
