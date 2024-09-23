@implementation _UISearchBarTextFieldTokenCounter

- (NSIndexSet)tokenCharacterIndexes
{
  void *v3;
  void *v4;

  if (-[NSTextStorage editedMask](self->_textStorage, "editedMask"))
  {
    v3 = (void *)objc_opt_new();
    -[_UISearchBarTextFieldTokenCounter _addCharacterIndexesOfTokensInRange:toIndexSet:](self, "_addCharacterIndexesOfTokensInRange:toIndexSet:", 0, -[NSTextStorage length](self->_textStorage, "length"), v3);
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = (void *)-[NSMutableIndexSet copy](self->_tokenCharacterIndexes, "copy");
  }
  return (NSIndexSet *)v4;
}

- (_NSRange)characterRangeOfTextAfterLastToken
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSMutableIndexSet *tokenCharacterIndexes;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 buf;
  uint64_t v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  _NSRange result;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableIndexSet count](self->_tokenCharacterIndexes, "count");
  v4 = -[NSTextStorage length](self->_textStorage, "length");
  if (v3)
  {
    v5 = -[NSMutableIndexSet lastIndex](self->_tokenCharacterIndexes, "lastIndex") + 1;
    v6 = v4 - v3;
    v7 = v5 + v4 - v3;
    if (os_variant_has_internal_diagnostics() && v7 > v4)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = self;
          _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Invalid configuration of UISearchTextField with token following text. See rdar://102647358. %@", (uint8_t *)&buf, 0xCu);
        }

      }
      else
      {
        v12 = characterRangeOfTextAfterLastToken___s_category;
        if (!characterRangeOfTextAfterLastToken___s_category)
        {
          v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v12, (unint64_t *)&characterRangeOfTextAfterLastToken___s_category);
        }
        v13 = *(NSObject **)(v12 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = self;
          _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Invalid configuration of UISearchTextField with token following text. See rdar://102647358. %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    if (v7 <= v4)
    {
      v4 = v6;
    }
    else
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v21 = 0x3010000000;
      v22 = &unk_18685B0AF;
      v23 = xmmword_186679030;
      tokenCharacterIndexes = self->_tokenCharacterIndexes;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __71___UISearchBarTextFieldTokenCounter_characterRangeOfTextAfterLastToken__block_invoke;
      v15[3] = &unk_1E16DEC50;
      v15[4] = &v16;
      v15[5] = &buf;
      -[NSMutableIndexSet enumerateIndexesWithOptions:usingBlock:](tokenCharacterIndexes, "enumerateIndexesWithOptions:usingBlock:", 2, v15);
      v9 = *((_QWORD *)&buf + 1);
      v5 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 32);
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = 0;
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 32) = 0;
        v4 = v17[3];
        *(_QWORD *)(v9 + 40) = v4;
      }
      else
      {
        v4 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      }
      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = v5;
  v11 = v4;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_UISearchBarTextFieldTokenCounter)initWithTextStorage:(id)a3
{
  id v5;
  _UISearchBarTextFieldTokenCounter *v6;
  _UISearchBarTextFieldTokenCounter *v7;
  uint64_t v8;
  NSMutableIndexSet *tokenCharacterIndexes;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id textStorageObservation;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UISearchBarTextFieldTokenCounter;
  v6 = -[_UISearchBarTextFieldTokenCounter init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_textStorage, a3);
    v8 = objc_opt_new();
    tokenCharacterIndexes = v7->_tokenCharacterIndexes;
    v7->_tokenCharacterIndexes = (NSMutableIndexSet *)v8;

    -[_UISearchBarTextFieldTokenCounter _addCharacterIndexesOfTokensInRange:toIndexSet:](v7, "_addCharacterIndexesOfTokensInRange:toIndexSet:", 0, objc_msgSend(v5, "length"), v7->_tokenCharacterIndexes);
    objc_initWeak(&location, v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)off_1E16791A8;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57___UISearchBarTextFieldTokenCounter_initWithTextStorage___block_invoke;
    v16[3] = &unk_1E16B22E0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v12, v5, v11, v16);
    v13 = objc_claimAutoreleasedReturnValue();
    textStorageObservation = v7->_textStorageObservation;
    v7->_textStorageObservation = (id)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)_addCharacterIndexesOfTokensInRange:(_NSRange)a3 toIndexSet:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSTextStorage *textStorage;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  textStorage = self->_textStorage;
  v9 = *(_QWORD *)off_1E1678C48;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84___UISearchBarTextFieldTokenCounter__addCharacterIndexesOfTokensInRange_toIndexSet___block_invoke;
  v11[3] = &unk_1E16B15D0;
  v12 = v7;
  v10 = v7;
  -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v9, location, length, 0, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCharacterIndexes, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong(&self->_textStorageObservation, 0);
}

- (void)_handleProcessEditing
{
  if (-[NSTextStorage editedMask](self->_textStorage, "editedMask"))
  {
    -[NSMutableIndexSet removeAllIndexes](self->_tokenCharacterIndexes, "removeAllIndexes");
    -[_UISearchBarTextFieldTokenCounter _addCharacterIndexesOfTokensInRange:toIndexSet:](self, "_addCharacterIndexesOfTokensInRange:toIndexSet:", 0, -[NSTextStorage length](self->_textStorage, "length"), self->_tokenCharacterIndexes);
  }
}

- (_NSRange)characterRangeOfAllTokens
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[NSMutableIndexSet count](self->_tokenCharacterIndexes, "count");
  v3 = 0;
  result.length = v2;
  result.location = v3;
  return result;
}

- (unint64_t)characterIndexForInsertingTokenAtIndex:(unint64_t)a3
{
  uint64_t v5;

  v5 = -[NSMutableIndexSet count](self->_tokenCharacterIndexes, "count");
  if (v5 + 1 < a3)
    ThrowRangeException(a3, v5);
  if (a3)
    return -[_UISearchBarTextFieldTokenCounter characterIndexForSelectingOrRemovingTokenAtIndex:](self, "characterIndexForSelectingOrRemovingTokenAtIndex:", a3 - 1)+ 1;
  else
    return 0;
}

- (unint64_t)characterIndexForSelectingOrRemovingTokenAtIndex:(unint64_t)a3
{
  unint64_t v5;
  NSMutableIndexSet *tokenCharacterIndexes;
  unint64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];

  v5 = -[NSMutableIndexSet count](self->_tokenCharacterIndexes, "count");
  if (v5 < a3)
    ThrowRangeException(a3, v5);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  tokenCharacterIndexes = self->_tokenCharacterIndexes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86___UISearchBarTextFieldTokenCounter_characterIndexForSelectingOrRemovingTokenAtIndex___block_invoke;
  v9[3] = &unk_1E16DEC28;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = v14;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](tokenCharacterIndexes, "enumerateIndexesUsingBlock:", v9);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  return v7;
}

- (_NSRange)subrangeOfTextAfterLastTokenForCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  length = a3.length;
  v4 = a3.location - -[NSMutableIndexSet count](self->_tokenCharacterIndexes, "count");
  v5 = length;
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)characterRangeForSubrangeOfTextAfterLastToken:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = -[NSMutableIndexSet count](self->_tokenCharacterIndexes, "count");
  v7 = -[NSTextStorage length](self->_textStorage, "length");
  if (v6)
    location += -[_UISearchBarTextFieldTokenCounter characterIndexForInsertingTokenAtIndex:](self, "characterIndexForInsertingTokenAtIndex:", v6);
  if (location >= v7)
    v8 = v7;
  else
    v8 = location;
  if (length >= v7 - v8)
    v9 = v7 - v8;
  else
    v9 = length;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)tokenAtCharacterIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678C48, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "token");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)indexOfTokenAtCharacterIndex:(unint64_t)a3
{
  void *v7;

  if ((-[NSMutableIndexSet containsIndex:](self->_tokenCharacterIndexes, "containsIndex:") & 1) != 0)
  {
    if (a3)
      return -[NSMutableIndexSet countOfIndexesInRange:](self->_tokenCharacterIndexes, "countOfIndexesInRange:", 0, a3 - 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarTextFieldTokenCounter.m"), 194, CFSTR("Asked for token at character index %lu which is not in set %@"), a3, self->_tokenCharacterIndexes);

    if (a3)
      return -[NSMutableIndexSet countOfIndexesInRange:](self->_tokenCharacterIndexes, "countOfIndexesInRange:", 0, a3 - 1);
  }
  return 0;
}

@end
