@implementation ICNoteTimelineSectionIdentifier

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteTimelineSectionIdentifier;
  if (-[ICNoteSectionIdentifier isEqual:](&v8, sel_isEqual_, v4))
  {
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICNoteTimelineSectionIdentifier isEqualToICNoteTimelineSectionIdentifier:](self, "isEqualToICNoteTimelineSectionIdentifier:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToICNoteTimelineSectionIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = -[ICNoteTimelineSectionIdentifier timelineSectionType](self, "timelineSectionType");
  if (v5 == objc_msgSend(v4, "timelineSectionType"))
  {
    -[ICNoteTimelineSectionIdentifier sectionTitle](self, "sectionTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sectionTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = -[ICNoteTimelineSectionIdentifier sortOrder](self, "sortOrder");
      v9 = v8 == objc_msgSend(v4, "sortOrder");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  id v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICNoteTimelineSectionIdentifier;
  v3 = -[ICNoteSectionIdentifier hash](&v15, sel_hash);
  v4 = -[ICNoteTimelineSectionIdentifier timelineSectionType](self, "timelineSectionType");
  -[ICNoteTimelineSectionIdentifier sectionTitle](self, "sectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  -[ICNoteTimelineSectionIdentifier sortOrder](self, "sortOrder");
  v13 = ICHashWithHashKeys((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12, v4);

  return v13;
}

- (int64_t)timelineSectionType
{
  return self->_timelineSectionType;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

- (ICNoteTimelineSectionIdentifier)initWithTimelineSectionType:(int64_t)a3 referenceDate:(id)a4 title:(id)a5 sortOrder:(unint64_t)a6
{
  id v11;
  id v12;
  ICNoteTimelineSectionIdentifier *v13;
  ICNoteTimelineSectionIdentifier *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICNoteTimelineSectionIdentifier;
  v13 = -[ICNoteSectionIdentifier initWithNoteSectionType:](&v16, sel_initWithNoteSectionType_, 5);
  v14 = v13;
  if (v13)
  {
    v13->_timelineSectionType = a3;
    objc_storeStrong((id *)&v13->_referenceDate, a4);
    objc_storeStrong((id *)&v14->_sectionTitle, a5);
    v14->_sortOrder = a6;
  }

  return v14;
}

+ (id)sortDescriptorsWithDirection:(int64_t)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v3 = a3 == 0;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timelineSectionType"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortOrder"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICNoteTimelineSectionIdentifier typeString](self, "typeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteTimelineSectionIdentifier sectionTitle](self, "sectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type: %@, title: %@, sortOrder: %lu"), v4, v5, -[ICNoteTimelineSectionIdentifier sortOrder](self, "sortOrder"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)typeString
{
  int64_t v2;

  v2 = -[ICNoteTimelineSectionIdentifier timelineSectionType](self, "timelineSectionType");
  if ((unint64_t)(v2 - 1) > 8)
    return CFSTR("Invitations");
  else
    return off_1E5C1E4C8[v2 - 1];
}

- (void)setTimelineSectionType:(int64_t)a3
{
  self->_timelineSectionType = a3;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSortOrder:(unint64_t)a3
{
  self->_sortOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end
