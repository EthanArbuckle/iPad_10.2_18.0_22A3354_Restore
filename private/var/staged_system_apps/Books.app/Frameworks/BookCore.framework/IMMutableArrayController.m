@implementation IMMutableArrayController

- (IMMutableArrayController)initWithContent:(id)a3
{
  id v5;
  IMMutableArrayController *v6;
  IMMutableArrayController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMMutableArrayController;
  v6 = -[IMMutableArrayController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_content, a3);

  return v7;
}

- (void)rearrangeObjects
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMMutableArrayController content](self, "content"));
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMMutableArrayController arrangeObjects:](self, "arrangeObjects:", v3));
  -[IMArrayController setArrangedObjects:](self, "setArrangedObjects:", v4);

}

- (id)arrangeObjects:(id)a3
{
  return a3;
}

- (NSMutableArray)content
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
