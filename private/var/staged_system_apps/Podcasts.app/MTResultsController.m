@implementation MTResultsController

- (MTResultsControllerDelegate)delegate
{
  return (MTResultsControllerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController allObjects](self, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Section: %@ (%lu)"), v3, objc_msgSend(v4, "count")));

  return v5;
}

- (id)objectAtIndexPath:(id)a3
{
  return 0;
}

- (id)indexPathForObject:(id)a3
{
  return 0;
}

- (unint64_t)numberOfObjectsInSection:(unint64_t)a3
{
  return 0;
}

- (id)allObjects
{
  return 0;
}

- (unint64_t)indexOfObject:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController indexPathForObject:](self, "indexPathForObject:", a3));
  v4 = v3;
  if (v3)
    v5 = (unint64_t)objc_msgSend(v3, "row");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController objectAtIndexPath:](self, "objectAtIndexPath:", v4));

  return v5;
}

- (unint64_t)numberOfObjects
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTResultsController allObjects](self, "allObjects"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (BOOL)hasObjects
{
  return -[MTResultsController numberOfObjects](self, "numberOfObjects") != 0;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->title, 0);
}

@end
