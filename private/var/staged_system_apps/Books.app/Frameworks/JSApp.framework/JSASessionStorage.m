@implementation JSASessionStorage

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A4B4;
  block[3] = &unk_9E1B8;
  block[4] = a1;
  if (qword_B9F50 != -1)
    dispatch_once(&qword_B9F50, block);
  return (id)qword_B9F58;
}

- (JSASessionStorage)init
{
  JSASessionStorage *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *values;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JSASessionStorage;
  v2 = -[JSASessionStorage init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    values = v2->_values;
    v2->_values = v3;

  }
  return v2;
}

- (unint64_t)length
{
  return (unint64_t)-[NSMutableDictionary count](self->_values, "count");
}

- (id)getItem:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", a3);
}

- (void)setItem:(id)a3 :(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", a4, a3);
}

- (void)removeItem:(id)a3
{
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_values, "removeObjectForKey:");
}

- (void)clear
{
  -[NSMutableDictionary removeAllObjects](self->_values, "removeAllObjects");
}

- (NSMutableDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
