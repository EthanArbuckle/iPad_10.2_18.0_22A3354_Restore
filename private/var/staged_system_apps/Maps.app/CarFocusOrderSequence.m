@implementation CarFocusOrderSequence

+ (id)sequenceWithItems:(id)a3 options:(unint64_t)a4
{
  id v5;
  CarFocusOrderSequence *v6;

  v5 = a3;
  v6 = objc_alloc_init(CarFocusOrderSequence);
  -[CarFocusOrderSequence setItems:](v6, "setItems:", v5);

  -[CarFocusOrderSequence setOptions:](v6, "setOptions:", a4);
  return v6;
}

- (BOOL)isLooping
{
  return (-[CarFocusOrderSequence options](self, "options") >> 3) & 1;
}

- (BOOL)flipForRHD
{
  void *v3;
  unsigned __int8 v4;

  if ((-[CarFocusOrderSequence options](self, "options") & 4) == 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v4 = objc_msgSend(v3, "rightHandDrive");

  return v4;
}

- (NSArray)items
{
  unint64_t v3;
  char v4;
  void *v5;
  unsigned int v6;
  void *v7;
  NSArray *v8;

  v3 = -[CarFocusOrderSequence options](self, "options");
  if (v3)
    v4 = v3;
  else
    v4 = 3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v6 = objc_msgSend(v5, "rightHandDrive");

  if (!v6)
  {
    if ((v4 & 1) == 0)
      goto LABEL_9;
LABEL_10:
    v8 = self->_items;
    return v8;
  }
  if ((v4 & 2) != 0)
    goto LABEL_10;
  if ((v4 & 4) == 0)
  {
LABEL_9:
    v8 = (NSArray *)&__NSArray0__struct;
    return v8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_items, "reverseObjectEnumerator"));
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  return v8;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
