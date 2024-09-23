@implementation CRLRepAccessibilitySelectionRangeCache

- (CRLRepAccessibilitySelectionRangeCache)init
{
  return -[CRLRepAccessibilitySelectionRangeCache initWithRep:selectedRangeInStorage:](self, "initWithRep:selectedRangeInStorage:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (CRLRepAccessibilitySelectionRangeCache)initWithRep:(id)a3 selectedRangeInStorage:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CRLRepAccessibilitySelectionRangeCache *result;
  objc_super v7;

  length = a4.length;
  location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)CRLRepAccessibilitySelectionRangeCache;
  result = -[CRLRepAccessibilitySelectionRangeCache init](&v7, "init", a3);
  if (result)
  {
    result->_rangeInStorage.location = location;
    result->_rangeInStorage.length = length;
  }
  return result;
}

- (BOOL)isSafeToRestoreSelectionInRep:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  BOOL v11;
  char *v12;
  char *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxStorage"));
  v6 = (char *)objc_msgSend(v5, "crlaxRange");
  v8 = v7;
  v9 = (char *)-[CRLRepAccessibilitySelectionRangeCache rangeInStorage](self, "rangeInStorage");
  if (v6 > v9)
  {
    v11 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v12 = &v6[v8];
  v13 = &v9[v10];

  if (v12 >= v13)
  {
    v14 = -[CRLRepAccessibilitySelectionRangeCache versionNumber](self, "versionNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxStorage"));
    v11 = v14 == objc_msgSend(v5, "crlaxChangeCount");
    goto LABEL_6;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSRange v10;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v10.location = (NSUInteger)-[CRLRepAccessibilitySelectionRangeCache rangeInStorage](self, "rangeInStorage");
  v6 = NSStringFromRange(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; Range: %@; Version: %lu>"),
                   v5,
                   self,
                   v7,
                   -[CRLRepAccessibilitySelectionRangeCache versionNumber](self, "versionNumber")));

  return v8;
}

- (_NSRange)rangeInStorage
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeInStorage.length;
  location = self->_rangeInStorage.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeInStorage:(_NSRange)a3
{
  self->_rangeInStorage = a3;
}

- (unint64_t)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(unint64_t)a3
{
  self->_versionNumber = a3;
}

@end
