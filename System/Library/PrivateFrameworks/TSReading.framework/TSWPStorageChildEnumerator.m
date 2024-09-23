@implementation TSWPStorageChildEnumerator

- (TSWPStorageChildEnumerator)initWithStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPStorageChildEnumerator *v7;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)TSWPStorageChildEnumerator;
  v7 = -[TSWPStorageChildEnumerator init](&v9, sel_init);
  if (v7)
  {
    v7->_storage = (TSWPStorage *)a3;
    v7->_charRange.location = location;
    v7->_charRange.length = length;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPStorageChildEnumerator;
  -[TSWPStorageChildEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  NSArray *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unsigned int v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  NSUInteger v36;
  NSUInteger index;
  NSArray *charOffsetArray;
  void *v39;
  NSUInteger length;
  NSUInteger location;
  _QWORD v44[2];

  if (!self->_charOffsetArray)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_charOffsetArray = v3;
    length = self->_charRange.length;
    location = self->_charRange.location;
    v4 = -[TSWPStorage attachmentIndexRangeForTextRange:](self->_storage, "attachmentIndexRangeForTextRange:");
    if (v5)
    {
      v6 = v4;
      v7 = v5;
      v8 = 0;
      v9 = 1;
      do
      {
        v44[0] = 0x7FFFFFFFFFFFFFFFLL;
        v10 = -[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self->_storage, "attachmentAtAttachmentIndex:outCharIndex:", v8 + v6, v44);
        if (v10)
        {
          v11 = v10;
          v12 = objc_alloc(MEMORY[0x24BDD16E0]);
          v13 = (void *)objc_msgSend(v12, "initWithUnsignedInteger:", v44[0]);
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v11, v13, 0);
          -[NSArray addObject:](v3, "addObject:", v14);

        }
        v8 = v9;
        v15 = v7 > v9++;
      }
      while (v15);
    }
    v16 = -[TSWPStorage footnoteRangeForTextRange:](self->_storage, "footnoteRangeForTextRange:", location, length);
    if (v17)
    {
      v18 = v16;
      v19 = v17;
      v20 = 0;
      v21 = 1;
      do
      {
        v44[0] = 0x7FFFFFFFFFFFFFFFLL;
        v22 = -[TSWPStorage footnoteAtFootnoteIndex:outCharIndex:](self->_storage, "footnoteAtFootnoteIndex:outCharIndex:", v20 + v18, v44);
        if (v22)
        {
          v23 = v22;
          v24 = objc_alloc(MEMORY[0x24BDD16E0]);
          v25 = (void *)objc_msgSend(v24, "initWithUnsignedInteger:", v44[0]);
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v23, v25, 0);
          -[NSArray addObject:](v3, "addObject:", v26);

        }
        v20 = v21;
        v15 = v19 > v21++;
      }
      while (v15);
    }
    v27 = -[TSWPStorage sectionCount](self->_storage, "sectionCount");
    if (v27)
    {
      v28 = v27;
      v29 = 0;
      v30 = 1;
      do
      {
        v31 = -[TSWPStorage sectionAtSectionIndex:effectiveRange:](self->_storage, "sectionAtSectionIndex:effectiveRange:", v29, v44);
        if (v31)
        {
          v32 = v31;
          v33 = objc_alloc(MEMORY[0x24BDD16E0]);
          v34 = (void *)objc_msgSend(v33, "initWithUnsignedInteger:", v44[0]);
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v32, v34, 0);
          -[NSArray addObject:](v3, "addObject:", v35);

        }
        v29 = v30;
        v15 = v28 > v30++;
      }
      while (v15);
    }
    -[NSArray sortUsingFunction:context:](v3, "sortUsingFunction:context:", comparePairs, 0);
  }
  if (!self->_storage)
    return 0;
  while (1)
  {
    v36 = -[NSArray count](self->_charOffsetArray, "count");
    index = self->_index;
    if (v36 <= index)
    {

      v39 = 0;
      self->_storage = 0;
      return v39;
    }
    charOffsetArray = self->_charOffsetArray;
    self->_index = index + 1;
    v39 = (void *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](charOffsetArray, "objectAtIndexedSubscript:"), "objectAtIndexedSubscript:", 0);
    if ((objc_msgSend(v39, "conformsToProtocol:", &unk_254FAAAE0) & 1) != 0)
      return v39;
    if (objc_msgSend(v39, "isDrawable"))
      return (id)objc_msgSend(v39, "drawable");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    if (!self->_storage)
      return 0;
  }
  return (id)objc_msgSend(v39, "containedStorage");
}

@end
