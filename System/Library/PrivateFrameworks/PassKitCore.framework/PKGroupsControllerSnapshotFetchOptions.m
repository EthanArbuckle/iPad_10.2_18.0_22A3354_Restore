@implementation PKGroupsControllerSnapshotFetchOptions

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 limitResults;
  id v5;
  id v6;

  limitResults = self->_limitResults;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", limitResults, CFSTR("limitResults"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includeAnnotations, CFSTR("includeAnnotations"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_allowedPassType);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("alowedPassType"));

}

- (void)setLimitResults:(BOOL)a3
{
  self->_limitResults = a3;
}

- (void)setIncludeAnnotations:(BOOL)a3
{
  self->_includeAnnotations = a3;
}

- (void)setAllowedPassType:(unint64_t)a3
{
  self->_allowedPassType = a3;
}

- (BOOL)limitResults
{
  return self->_limitResults;
}

- (PKGroupsControllerSnapshotFetchOptions)initWithCoder:(id)a3
{
  id v4;
  PKGroupsControllerSnapshotFetchOptions *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKGroupsControllerSnapshotFetchOptions;
  v5 = -[PKGroupsControllerSnapshotFetchOptions init](&v8, sel_init);
  if (v5)
  {
    v5->_limitResults = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("limitResults"));
    v5->_includeAnnotations = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeAnnotations"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alowedPassType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowedPassType = objc_msgSend(v6, "unsignedIntegerValue");

  }
  return v5;
}

- (BOOL)includeAnnotations
{
  return self->_includeAnnotations;
}

- (unint64_t)allowedPassType
{
  return self->_allowedPassType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[PKGroupsControllerSnapshotFetchOptions init](+[PKGroupsControllerSnapshotFetchOptions allocWithZone:](PKGroupsControllerSnapshotFetchOptions, "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = self->_limitResults;
  *((_BYTE *)result + 9) = self->_includeAnnotations;
  *((_QWORD *)result + 2) = self->_allowedPassType;
  return result;
}

@end
