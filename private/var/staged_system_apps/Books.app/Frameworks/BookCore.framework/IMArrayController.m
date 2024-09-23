@implementation IMArrayController

- (void)setArrangedObjects:(id)a3
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;

  v8 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMArrayController arrangedObjects](self, "arrangedObjects"));
  if (v5 == v8)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMArrayController arrangedObjects](self, "arrangedObjects"));
    v7 = objc_msgSend(v8, "isEqualToArray:", v6);

    if ((v7 & 1) == 0)
    {
      -[IMArrayController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("arrangedObjects"));
      objc_storeStrong((id *)&self->_arrangedObjects, a3);
      -[IMArrayController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("arrangedObjects"));
    }
  }

}

- (NSArray)arrangedObjects
{
  return self->_arrangedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedObjects, 0);
}

@end
