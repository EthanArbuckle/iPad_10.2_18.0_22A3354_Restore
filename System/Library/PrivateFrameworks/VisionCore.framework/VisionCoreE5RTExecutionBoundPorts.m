@implementation VisionCoreE5RTExecutionBoundPorts

- (VisionCoreE5RTExecutionBoundPorts)init
{
  return -[VisionCoreE5RTExecutionBoundPorts initWithCapacity:](self, "initWithCapacity:", 8);
}

- (VisionCoreE5RTExecutionBoundPorts)initWithCapacity:(unint64_t)a3
{
  VisionCoreE5RTExecutionBoundPorts *v4;
  uint64_t v5;
  NSMutableDictionary *namedPorts;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VisionCoreE5RTExecutionBoundPorts;
  v4 = -[VisionCoreE5RTExecutionBoundPorts init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", a3);
    namedPorts = v4->_namedPorts;
    v4->_namedPorts = (NSMutableDictionary *)v5;

  }
  return v4;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  objc_super v4;

  v3 = self->_namedPorts;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1498);
  -[NSMutableDictionary removeAllObjects](v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)VisionCoreE5RTExecutionBoundPorts;
  -[VisionCoreE5RTExecutionBoundPorts dealloc](&v4, sel_dealloc);
}

- (NSArray)allPortNames
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_namedPorts, "allKeys");
}

- (BOOL)recordPort:(e5rt_io_port *)a3 named:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v8 = a4;
  -[NSMutableDictionary objectForKey:](self->_namedPorts, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a5)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Port \"%@\" has already been bound"), v8);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_namedPorts, "setObject:forKey:", v11, v8);
  }

  return v9 == 0;
}

- (BOOL)getPort:(e5rt_io_port *)a3 named:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  -[NSMutableDictionary objectForKey:](self->_namedPorts, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (a3)
      *a3 = (e5rt_io_port *)objc_msgSend(v9, "pointerValue");
  }
  else if (a5)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Port \"%@\" has not been bound"), v8);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10 != 0;
}

- (void)releaseAllPorts
{
  NSMutableDictionary *v2;

  v2 = self->_namedPorts;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v2, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1498);
  -[NSMutableDictionary removeAllObjects](v2, "removeAllObjects");

}

- (void)releasePortNamed:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_namedPorts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_namedPorts, "removeObjectForKey:", v4);
    objc_msgSend(v5, "pointerValue");
    e5rt_io_port_release();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedPorts, 0);
}

@end
