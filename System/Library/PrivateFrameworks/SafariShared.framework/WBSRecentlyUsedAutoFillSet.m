@implementation WBSRecentlyUsedAutoFillSet

- (WBSRecentlyUsedAutoFillSet)initWithFillMatches:(id)a3 skipMatches:(id)a4 label:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSRecentlyUsedAutoFillSet *v11;
  uint64_t v12;
  NSArray *fillMatches;
  uint64_t v14;
  NSArray *skipMatches;
  uint64_t v16;
  NSString *label;
  WBSRecentlyUsedAutoFillSet *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSRecentlyUsedAutoFillSet;
  v11 = -[WBSRecentlyUsedAutoFillSet init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    fillMatches = v11->_fillMatches;
    v11->_fillMatches = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    skipMatches = v11->_skipMatches;
    v11->_skipMatches = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    label = v11->_label;
    v11->_label = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSArray)fillMatches
{
  return self->_fillMatches;
}

- (NSArray)skipMatches
{
  return self->_skipMatches;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_skipMatches, 0);
  objc_storeStrong((id *)&self->_fillMatches, 0);
}

@end
