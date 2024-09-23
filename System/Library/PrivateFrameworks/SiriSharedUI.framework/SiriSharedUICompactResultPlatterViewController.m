@implementation SiriSharedUICompactResultPlatterViewController

- (void)setSiriContentViewControllers:(id)a3
{
  NSArray *v5;
  NSArray **p_siriContentViewControllers;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;

  v5 = (NSArray *)a3;
  p_siriContentViewControllers = &self->_siriContentViewControllers;
  if (self->_siriContentViewControllers != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_siriContentViewControllers, a3);
    v7 = (void *)objc_opt_new();
    if (-[NSArray count](*p_siriContentViewControllers, "count"))
    {
      v8 = 0;
      do
      {
        -[NSArray objectAtIndex:](v12, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray lastObject](v12, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v9);
        ++v8;
        if (v9 != v10)
        {
          -[NSArray objectAtIndex:](v12, "objectAtIndex:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SiriSharedUIContentPlatterViewController appendSeparatorToViewControllers:forNextViewController:](self, "appendSeparatorToViewControllers:forNextViewController:", v7, v11);

        }
      }
      while (-[NSArray count](*p_siriContentViewControllers, "count") > v8);
    }
    -[SiriSharedUIContentPlatterViewController setContentViewControllers:](self, "setContentViewControllers:", v7);

    v5 = v12;
  }

}

- (NSArray)siriContentViewControllers
{
  return self->_siriContentViewControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriContentViewControllers, 0);
}

@end
