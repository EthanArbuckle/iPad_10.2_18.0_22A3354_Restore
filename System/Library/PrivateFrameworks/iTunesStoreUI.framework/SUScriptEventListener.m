@implementation SUScriptEventListener

- (SUScriptEventListener)init
{
  SUScriptEventListener *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptEventListener;
  v2 = -[SUScriptEventListener init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v3;

    -[NSLock setName:](v2->_lock, "setName:", CFSTR("SUScriptEventListener"));
  }
  return v2;
}

- (WebScriptObject)callback
{
  WebScriptObject *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_callback;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSString)name
{
  NSString *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_name;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setCallback:(id)a3
{
  WebScriptObject *v5;

  v5 = (WebScriptObject *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_callback != v5)
    objc_storeStrong((id *)&self->_callback, a3);
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  NSString *v6;

  v6 = (NSString *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_name != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    name = self->_name;
    self->_name = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)setShouldUseCapture:(BOOL)a3
{
  -[NSLock lock](self->_lock, "lock");
  self->_useCapture = a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)shouldUseCapture
{
  BOOL useCapture;

  -[NSLock lock](self->_lock, "lock");
  useCapture = self->_useCapture;
  -[NSLock unlock](self->_lock, "unlock");
  return useCapture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_callback, 0);
}

@end
