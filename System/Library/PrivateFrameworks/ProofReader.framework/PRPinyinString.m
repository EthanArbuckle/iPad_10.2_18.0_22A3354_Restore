@implementation PRPinyinString

- (unint64_t)length
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]), "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]), "characterAtIndex:", a3);
}

- (PRPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 originalLength:(unint64_t)a7 modificationType:(unint64_t)a8 originalModificationRange:(_NSRange)a9 finalModificationRange:(_NSRange)a10
{
  PRPinyinString *v16;
  uint64_t v17;
  _NSRange *v18;
  _NSRange *originalSyllableRanges;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PRPinyinString;
  v16 = -[PRPinyinString init](&v21, sel_init);
  v17 = objc_msgSend(a3, "copy");
  *(Class *)((char *)&v16->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]) = (Class)v17;
  *(Class *)((char *)&v16->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA8]) = (Class)a4;
  *((_BYTE *)&v16->super.super.super.isa + (int)*MEMORY[0x1E0CB3B88]) = a5;
  *(Class *)((char *)&v16->super.super.super.isa + (int)*MEMORY[0x1E0CB3B98]) = (Class)a6;
  v16->_originalCheckedLength = a7;
  v16->_originalLength = a7;
  v16->_modificationCount = 1;
  v16->_modificationTypes = (unint64_t *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v16->_originalRanges = (_NSRange *)malloc_type_malloc(16 * v16->_modificationCount, 0x1000040451B5BE8uLL);
  v16->_finalRanges = (_NSRange *)malloc_type_malloc(16 * v16->_modificationCount, 0x1000040451B5BE8uLL);
  v16->_originalSyllableRanges = (_NSRange *)malloc_type_malloc(16 * v16->_modificationCount, 0x1000040451B5BE8uLL);
  v18 = (_NSRange *)malloc_type_malloc(16 * v16->_modificationCount, 0x1000040451B5BE8uLL);
  v16->_originalAdditionalSyllableRanges = v18;
  *v16->_modificationTypes = a8;
  *v16->_originalRanges = a9;
  originalSyllableRanges = v16->_originalSyllableRanges;
  *v16->_finalRanges = a10;
  *originalSyllableRanges = (_NSRange)xmmword_1DE2EC5B0;
  *v18 = (_NSRange)xmmword_1DE2EC5B0;
  return v16;
}

- (PRPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 originalLength:(unint64_t)a7 modificationType:(unint64_t)a8 originalModificationRange:(_NSRange)a9 finalModificationRange:(_NSRange)a10 originalSyllableRange:(_NSRange)a11
{
  PRPinyinString *v16;
  uint64_t v17;
  _NSRange *v18;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PRPinyinString;
  v16 = -[PRPinyinString init](&v21, sel_init);
  v17 = objc_msgSend(a3, "copy");
  *(Class *)((char *)&v16->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]) = (Class)v17;
  *(Class *)((char *)&v16->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA8]) = (Class)a4;
  *((_BYTE *)&v16->super.super.super.isa + (int)*MEMORY[0x1E0CB3B88]) = a5;
  *(Class *)((char *)&v16->super.super.super.isa + (int)*MEMORY[0x1E0CB3B98]) = (Class)a6;
  v16->_originalCheckedLength = a7;
  v16->_originalLength = a7;
  v16->_modificationCount = 1;
  v16->_modificationTypes = (unint64_t *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v16->_originalRanges = (_NSRange *)malloc_type_malloc(16 * v16->_modificationCount, 0x1000040451B5BE8uLL);
  v16->_finalRanges = (_NSRange *)malloc_type_malloc(16 * v16->_modificationCount, 0x1000040451B5BE8uLL);
  v16->_originalSyllableRanges = (_NSRange *)malloc_type_malloc(16 * v16->_modificationCount, 0x1000040451B5BE8uLL);
  v18 = (_NSRange *)malloc_type_malloc(16 * v16->_modificationCount, 0x1000040451B5BE8uLL);
  v16->_originalAdditionalSyllableRanges = v18;
  *v16->_modificationTypes = a8;
  *v16->_originalRanges = a9;
  *v16->_finalRanges = a10;
  *v16->_originalSyllableRanges = a11;
  *v18 = (_NSRange)xmmword_1DE2EC5B0;
  return v16;
}

- (PRPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 originalLength:(unint64_t)a7 modificationType:(unint64_t)a8 originalModificationRange:(_NSRange)a9 finalModificationRange:(_NSRange)a10 originalSyllableRange:(_NSRange)a11 originalAdditionalSyllableRange:(_NSRange)a12
{
  PRPinyinString *v17;
  uint64_t v18;
  _NSRange *v19;
  _NSRange *originalSyllableRanges;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PRPinyinString;
  v17 = -[PRPinyinString init](&v23, sel_init);
  v18 = objc_msgSend(a3, "copy");
  *(Class *)((char *)&v17->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]) = (Class)v18;
  *(Class *)((char *)&v17->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA8]) = (Class)a4;
  *((_BYTE *)&v17->super.super.super.isa + (int)*MEMORY[0x1E0CB3B88]) = a5;
  *(Class *)((char *)&v17->super.super.super.isa + (int)*MEMORY[0x1E0CB3B98]) = (Class)a6;
  v17->_originalCheckedLength = a7;
  v17->_originalLength = a7;
  v17->_modificationCount = 1;
  v17->_modificationTypes = (unint64_t *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v17->_originalRanges = (_NSRange *)malloc_type_malloc(16 * v17->_modificationCount, 0x1000040451B5BE8uLL);
  v17->_finalRanges = (_NSRange *)malloc_type_malloc(16 * v17->_modificationCount, 0x1000040451B5BE8uLL);
  v17->_originalSyllableRanges = (_NSRange *)malloc_type_malloc(16 * v17->_modificationCount, 0x1000040451B5BE8uLL);
  v19 = (_NSRange *)malloc_type_malloc(16 * v17->_modificationCount, 0x1000040451B5BE8uLL);
  v17->_originalAdditionalSyllableRanges = v19;
  *v17->_modificationTypes = a8;
  *v17->_originalRanges = a9;
  originalSyllableRanges = v17->_originalSyllableRanges;
  *v17->_finalRanges = a10;
  *originalSyllableRanges = a11;
  *v19 = a12;
  return v17;
}

- (PRPinyinString)initWithUncheckedString:(id)a3 score:(unint64_t)a4 originalLength:(unint64_t)a5
{
  PRPinyinString *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRPinyinString;
  v8 = -[PRPinyinString init](&v11, sel_init);
  v9 = objc_msgSend(a3, "copy");
  *(Class *)((char *)&v8->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]) = (Class)v9;
  *(Class *)((char *)&v8->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA8]) = 0;
  *((_BYTE *)&v8->super.super.super.isa + (int)*MEMORY[0x1E0CB3B88]) = 0;
  *(Class *)((char *)&v8->super.super.super.isa + (int)*MEMORY[0x1E0CB3B98]) = (Class)a4;
  v8->_originalLength = a5;
  v8->_originalCheckedLength = 0;
  v8->_modificationCount = 0;
  v8->_modificationTypes = 0;
  v8->_originalRanges = 0;
  v8->_finalRanges = 0;
  v8->_originalSyllableRanges = 0;
  v8->_originalAdditionalSyllableRanges = 0;
  return v8;
}

- (PRPinyinString)initWithString:(id)a3 syllableCount:(unint64_t)a4 lastSyllableIsPartial:(BOOL)a5 score:(unint64_t)a6 originalLength:(unint64_t)a7 originalCheckedLength:(unint64_t)a8 numberOfModifications:(unint64_t)a9 modificationTypes:(unint64_t *)a10 originalModificationRanges:(_NSRange *)a11 finalModificationRanges:(_NSRange *)a12 originalSyllableRanges:(_NSRange *)a13 originalAdditionalSyllableRanges:(_NSRange *)a14
{
  PRPinyinString *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PRPinyinString;
  v20 = -[PRPinyinString init](&v25, sel_init);
  v21 = objc_msgSend(a3, "copy");
  *(Class *)((char *)&v20->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]) = (Class)v21;
  *(Class *)((char *)&v20->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA8]) = (Class)a4;
  *((_BYTE *)&v20->super.super.super.isa + (int)*MEMORY[0x1E0CB3B88]) = a5;
  *(Class *)((char *)&v20->super.super.super.isa + (int)*MEMORY[0x1E0CB3B98]) = (Class)a6;
  v20->_originalLength = a7;
  v20->_originalCheckedLength = a8;
  v20->_modificationCount = a9;
  v20->_modificationTypes = (unint64_t *)malloc_type_malloc(8 * a9, 0x100004000313F17uLL);
  v20->_originalRanges = (_NSRange *)malloc_type_malloc(16 * v20->_modificationCount, 0x1000040451B5BE8uLL);
  v20->_finalRanges = (_NSRange *)malloc_type_malloc(16 * v20->_modificationCount, 0x1000040451B5BE8uLL);
  v20->_originalSyllableRanges = (_NSRange *)malloc_type_malloc(16 * v20->_modificationCount, 0x1000040451B5BE8uLL);
  v20->_originalAdditionalSyllableRanges = (_NSRange *)malloc_type_malloc(16 * v20->_modificationCount, 0x1000040451B5BE8uLL);
  if (v20->_modificationCount)
  {
    v22 = 0;
    v23 = 0;
    do
    {
      v20->_modificationTypes[v23] = a10[v23];
      v20->_originalRanges[v22] = a11[v22];
      v20->_finalRanges[v22] = a12[v22];
      v20->_originalSyllableRanges[v22] = a13[v22];
      v20->_originalAdditionalSyllableRanges[v22] = a14[v22];
      ++v23;
      ++v22;
    }
    while (v23 < v20->_modificationCount);
  }
  return v20;
}

- (void)dealloc
{
  unint64_t *modificationTypes;
  _NSRange *originalRanges;
  _NSRange *finalRanges;
  _NSRange *originalSyllableRanges;
  _NSRange *originalAdditionalSyllableRanges;
  objc_super v8;

  modificationTypes = self->_modificationTypes;
  if (modificationTypes)
    free(modificationTypes);
  originalRanges = self->_originalRanges;
  if (originalRanges)
    free(originalRanges);
  finalRanges = self->_finalRanges;
  if (finalRanges)
    free(finalRanges);
  originalSyllableRanges = self->_originalSyllableRanges;
  if (originalSyllableRanges)
    free(originalSyllableRanges);
  originalAdditionalSyllableRanges = self->_originalAdditionalSyllableRanges;
  if (originalAdditionalSyllableRanges)
    free(originalAdditionalSyllableRanges);
  v8.receiver = self;
  v8.super_class = (Class)PRPinyinString;
  -[NSPinyinString dealloc](&v8, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t modificationCount;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v41 = v8;
    v42 = v7;
    v43 = v6;
    v44 = v5;
    v45 = v4;
    v46 = v3;
    v47 = v9;
    v48 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v13 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]), "isEqualToString:", objc_msgSend(a3, "string"));
    if (!v13)
      return v13;
    v14 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA8]);
    if (v14 != objc_msgSend(a3, "syllableCount")
      || (v15 = *((unsigned __int8 *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B88]),
          v15 != objc_msgSend(a3, "lastSyllableIsPartial"))
      || (v16 = *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B98]),
          v16 != objc_msgSend(a3, "score"))
      || (modificationCount = self->_modificationCount, modificationCount != objc_msgSend(a3, "numberOfModifications")))
    {
LABEL_21:
      LOBYTE(v13) = 0;
      return v13;
    }
    if (self->_modificationCount)
    {
      v18 = 0;
      while (1)
      {
        v19 = -[PRPinyinString typeOfModificationAtIndex:](self, "typeOfModificationAtIndex:", v18, v41, v42, v43, v44, v45, v46, v47, v48);
        if (v19 != objc_msgSend(a3, "typeOfModificationAtIndex:", v18))
          break;
        v20 = -[PRPinyinString originalRangeForModificationAtIndex:](self, "originalRangeForModificationAtIndex:", v18);
        v22 = v21;
        v24 = objc_msgSend(a3, "originalRangeForModificationAtIndex:", v18);
        LOBYTE(v13) = 0;
        if (v20 == v24 && v22 == v23)
        {
          v25 = -[PRPinyinString finalRangeForModificationAtIndex:](self, "finalRangeForModificationAtIndex:", v18);
          v27 = v26;
          v29 = objc_msgSend(a3, "finalRangeForModificationAtIndex:", v18);
          LOBYTE(v13) = 0;
          if (v25 == v29 && v27 == v28)
          {
            v30 = -[PRPinyinString originalSyllableRangeForModificationAtIndex:](self, "originalSyllableRangeForModificationAtIndex:", v18);
            v32 = v31;
            v34 = objc_msgSend(a3, "originalSyllableRangeForModificationAtIndex:", v18);
            LOBYTE(v13) = 0;
            if (v30 == v34 && v32 == v33)
            {
              v35 = -[PRPinyinString originalAdditionalSyllableRangeForModificationAtIndex:](self, "originalAdditionalSyllableRangeForModificationAtIndex:", v18);
              v37 = v36;
              v39 = objc_msgSend(a3, "originalAdditionalSyllableRangeForModificationAtIndex:", v18);
              LOBYTE(v13) = 0;
              if (v35 == v39 && v37 == v38)
              {
                ++v18;
                LOBYTE(v13) = 1;
                if (v18 < self->_modificationCount)
                  continue;
              }
            }
          }
        }
        return v13;
      }
      goto LABEL_21;
    }
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]), "hash");
  return *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA8]) ^ *(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B98]) ^ v3 ^ self->_modificationCount;
}

- (id)annotatedString
{
  void *v3;
  id v4;
  unint64_t v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = -[PRPinyinString nonPinyinIndexSet](self, "nonPinyinIndexSet");
  v5 = -[PRPinyinString length](self, "length");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__PRPinyinString_annotatedString__block_invoke;
  v7[3] = &unk_1EA8D6FA0;
  v7[5] = self;
  v7[6] = &v8;
  v7[4] = v3;
  objc_msgSend(v4, "enumerateRangesUsingBlock:", v7);
  if (v5 > v9[3])
    objc_msgSend(v3, "appendString:", -[PRPinyinString substringWithRange:](self, "substringWithRange:"));
  _Block_object_dispose(&v8, 8);
  return v3;
}

uint64_t __33__PRPinyinString_annotatedString__block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = result;
  if (a2 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
    result = objc_msgSend(*(id *)(result + 32), "appendString:", objc_msgSend(*(id *)(result + 40), "substringWithRange:"));
  if (a3)
    result = objc_msgSend(*(id *)(v5 + 32), "appendFormat:", CFSTR("[%@]"), objc_msgSend(*(id *)(v5 + 40), "substringWithRange:", a2, a3));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24) = a2 + a3;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@> syllables %lu last partial %d orig len %lu orig checked %lu repls %lu trans %lu inserts %lu deletes %lu fmi %lu score %lu ranges %lu total mods %lu"), -[PRPinyinString annotatedString](self, "annotatedString"), -[PRPinyinString syllableCount](self, "syllableCount"), -[PRPinyinString lastSyllableIsPartial](self, "lastSyllableIsPartial"), -[PRPinyinString originalLength](self, "originalLength"), -[PRPinyinString originalCheckedLength](self, "originalCheckedLength"), -[PRPinyinString numberOfReplacements](self, "numberOfReplacements"), -[PRPinyinString numberOfTranspositions](self, "numberOfTranspositions"), -[PRPinyinString numberOfInsertions](self, "numberOfInsertions"), -[PRPinyinString numberOfDeletions](self, "numberOfDeletions"), -[PRPinyinString indexOfFirstModification](self, "indexOfFirstModification"), -[PRPinyinString score](self, "score"), -[PRPinyinString numberOfNonPinyinRanges](self, "numberOfNonPinyinRanges"), -[PRPinyinString numberOfModifications](self, "numberOfModifications"));
}

- (id)string
{
  return *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]);
}

- (unint64_t)syllableCount
{
  return *(unint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA8]);
}

- (BOOL)lastSyllableIsPartial
{
  return *((_BYTE *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B88]);
}

- (unint64_t)score
{
  return *(unint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B98]);
}

- (unint64_t)originalLength
{
  return self->_originalLength;
}

- (unint64_t)originalCheckedLength
{
  return self->_originalCheckedLength;
}

- (unint64_t)finalCheckedLength
{
  unint64_t originalCheckedLength;

  originalCheckedLength = self->_originalCheckedLength;
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3BA0]), "length")
       + originalCheckedLength
       - self->_originalLength;
}

- (unint64_t)numberOfModifications
{
  return self->_modificationCount;
}

- (unint64_t)typeOfModificationAtIndex:(unint64_t)a3
{
  if (self->_modificationCount <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("index %lu count %lu"), a3, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B90]));
  return self->_modificationTypes[a3];
}

- (_NSRange)originalRangeForModificationAtIndex:(unint64_t)a3
{
  _NSRange *v5;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  if (self->_modificationCount <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("index %lu count %lu"), a3, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B90]));
  v5 = &self->_originalRanges[a3];
  location = v5->location;
  length = v5->length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)finalRangeForModificationAtIndex:(unint64_t)a3
{
  _NSRange *v5;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  if (self->_modificationCount <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("index %lu count %lu"), a3, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B90]));
  v5 = &self->_finalRanges[a3];
  location = v5->location;
  length = v5->length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)originalSyllableRangeForModificationAtIndex:(unint64_t)a3
{
  _NSRange *v5;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  if (self->_modificationCount <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("index %lu count %lu"), a3, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B90]));
  v5 = &self->_originalSyllableRanges[a3];
  location = v5->location;
  length = v5->length;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)originalAdditionalSyllableRangeForModificationAtIndex:(unint64_t)a3
{
  _NSRange *v5;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  if (self->_modificationCount <= a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("index %lu count %lu"), a3, *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0CB3B90]));
  v5 = &self->_originalAdditionalSyllableRanges[a3];
  location = v5->location;
  length = v5->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)indexOfFirstModification
{
  if (self->_modificationCount)
    return -[PRPinyinString finalRangeForModificationAtIndex:](self, "finalRangeForModificationAtIndex:", 0);
  else
    return 0;
}

- (unint64_t)numberOfNonPinyinRanges
{
  unint64_t v3;
  unint64_t v4;

  if (!self->_modificationCount)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    if (-[PRPinyinString typeOfModificationAtIndex:](self, "typeOfModificationAtIndex:", v4) == 5)
      ++v3;
    ++v4;
  }
  while (v4 < self->_modificationCount);
  return v3;
}

- (unint64_t)numberOfReplacements
{
  unint64_t v3;
  unint64_t v4;

  if (!self->_modificationCount)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    if (-[PRPinyinString typeOfModificationAtIndex:](self, "typeOfModificationAtIndex:", v4) == 1)
      ++v3;
    ++v4;
  }
  while (v4 < self->_modificationCount);
  return v3;
}

- (unint64_t)numberOfTranspositions
{
  unint64_t v3;
  unint64_t v4;

  if (!self->_modificationCount)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    if (-[PRPinyinString typeOfModificationAtIndex:](self, "typeOfModificationAtIndex:", v4) == 2)
      ++v3;
    ++v4;
  }
  while (v4 < self->_modificationCount);
  return v3;
}

- (unint64_t)numberOfInsertions
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (!self->_modificationCount)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    -[PRPinyinString originalRangeForModificationAtIndex:](self, "originalRangeForModificationAtIndex:", v4);
    v6 = v5;
    -[PRPinyinString finalRangeForModificationAtIndex:](self, "finalRangeForModificationAtIndex:", v4);
    v8 = v7 - v6;
    if (v7 < v6)
      v8 = 0;
    v3 += v8;
    ++v4;
  }
  while (v4 < self->_modificationCount);
  return v3;
}

- (unint64_t)numberOfDeletions
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (!self->_modificationCount)
    return 0;
  v3 = 0;
  v4 = 0;
  do
  {
    -[PRPinyinString originalRangeForModificationAtIndex:](self, "originalRangeForModificationAtIndex:", v4);
    v6 = v5;
    -[PRPinyinString finalRangeForModificationAtIndex:](self, "finalRangeForModificationAtIndex:", v4);
    v8 = v6 - v7;
    if (v6 < v7)
      v8 = 0;
    v3 += v8;
    ++v4;
  }
  while (v4 < self->_modificationCount);
  return v3;
}

- (_NSRange)nonPinyinRangeAtIndex:(unint64_t)a3
{
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  if (!self->_modificationCount)
  {
    v5 = 0;
    v6 = 0;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("index %lu count %lu"), a3, v6);
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (-[PRPinyinString typeOfModificationAtIndex:](self, "typeOfModificationAtIndex:", v7) == 5)
    {
      if (v6 == a3)
      {
        v8 = -[PRPinyinString finalRangeForModificationAtIndex:](self, "finalRangeForModificationAtIndex:", v7);
        v5 = v9;
      }
      ++v6;
    }
    ++v7;
  }
  while (v7 < self->_modificationCount);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
LABEL_12:
  v10 = v8;
  v11 = v5;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)nonPinyinIndexSet
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v4 = -[PRPinyinString numberOfNonPinyinRanges](self, "numberOfNonPinyinRanges");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = -[PRPinyinString nonPinyinRangeAtIndex:](self, "nonPinyinRangeAtIndex:", i);
      objc_msgSend(v3, "addIndexesInRange:", v7, v8);
    }
  }
  return v3;
}

+ (id)alternativesForInputString:(id)a3
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return -[AppleSpell spellServer:alternativesForPinyinInputString:](v4, "spellServer:alternativesForPinyinInputString:", 0, a3);
}

+ (id)prefixesForInputString:(id)a3
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return -[AppleSpell spellServer:prefixesForPinyinInputString:](v4, "spellServer:prefixesForPinyinInputString:", 0, a3);
}

+ (id)correctionsForInputString:(id)a3
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return -[AppleSpell spellServer:prefixesForPinyinInputString:](v4, "spellServer:prefixesForPinyinInputString:", 0, a3);
}

@end
