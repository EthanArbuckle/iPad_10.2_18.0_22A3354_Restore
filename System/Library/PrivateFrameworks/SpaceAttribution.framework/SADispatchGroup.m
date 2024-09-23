@implementation SADispatchGroup

- (SADispatchGroup)init
{
  SADispatchGroup *v2;
  dispatch_group_t v3;
  OS_dispatch_group *group;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SADispatchGroup;
  v2 = -[SADispatchGroup init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    v2->_entries = 0;
  }
  return v2;
}

- (void)enter
{
  SADispatchGroup *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_entries;
  dispatch_group_enter((dispatch_group_t)obj->_group);
  objc_sync_exit(obj);

}

- (void)leave
{
  int entries;
  BOOL v3;
  int v4;
  SADispatchGroup *obj;

  obj = self;
  objc_sync_enter(obj);
  entries = obj->_entries;
  v3 = __OFSUB__(entries, 1);
  v4 = entries - 1;
  if (v4 < 0 == v3)
  {
    obj->_entries = v4;
    dispatch_group_leave((dispatch_group_t)obj->_group);
  }
  objc_sync_exit(obj);

}

- (int)wait:(unint64_t)a3
{
  return dispatch_group_wait((dispatch_group_t)self->_group, a3);
}

- (OS_dispatch_group)group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)entries
{
  return self->_entries;
}

- (void)setEntries:(int)a3
{
  self->_entries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
