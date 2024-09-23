@implementation _UICollectionLayoutFramesQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryEnrollmentIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (id)initWithFrame:(void *)a3 adjustedForPinning:(void *)a4 index:(void *)a5 zIndex:(void *)a6 resultKind:(void *)a7 item:(void *)a8 auxillaryKind:(double)a9 supplementaryEnrollmentIdentifier:(double)a10
{
  id *v12;
  id *v24;
  void *v26;
  objc_super v27;

  v12 = a1;
  if (a1)
  {
    if (a5 == (void *)2 && !a8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithFrame_adjustedForPinning_index_zIndex_resultKind_item_auxillaryKind_supplementaryEnrollmentIdentifier_, v12, CFSTR("_UICollectionLayoutHelpers.m"), 1277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("supplementaryEnrollmentIdentifier"));

    }
    v27.receiver = v12;
    v27.super_class = (Class)_UICollectionLayoutFramesQueryResult;
    v24 = (id *)objc_msgSendSuper2(&v27, sel_init);
    v12 = v24;
    if (v24)
    {
      *((double *)v24 + 8) = a9;
      *((double *)v24 + 9) = a10;
      *((double *)v24 + 10) = a11;
      *((double *)v24 + 11) = a12;
      *((_BYTE *)v24 + 8) = a2;
      v24[2] = a3;
      v24[3] = a4;
      v24[4] = a5;
      objc_storeStrong(v24 + 5, a6);
      v12[7] = a7;
      objc_storeStrong(v12 + 6, a8);
    }
  }
  return v12;
}

- (id)copyWithFrame:(double)a3 index:(double)a4
{
  if (result)
    return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)[_UICollectionLayoutFramesQueryResult alloc], *((_BYTE *)result + 8), a2, result[3], result[4], result[5], result[7], result[6], a3, a4, a5, a6);
  return result;
}

- (_QWORD)auxillaryItem
{
  void *v1;

  if (a1)
  {
    if ((a1[4] & 0xFFFFFFFFFFFFFFFELL) == 2)
      v1 = (void *)a1[5];
    else
      v1 = 0;
    a1 = v1;
  }
  return a1;
}

- (id)copyWithOffset:(void *)a3 index:(double)a4 supplementaryEnrollmentIdentifier:(double)a5
{
  id *v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double Width;
  double Height;
  CGRect v16;
  CGRect v17;

  if (result)
  {
    v7 = result;
    v8 = *((double *)result + 8);
    v9 = *((double *)result + 9);
    v10 = *((double *)result + 10);
    v11 = *((double *)result + 11);
    v12 = a4 + v8;
    v13 = a5 + v9;
    v16.origin.x = v8;
    v16.origin.y = v9;
    v16.size.width = v10;
    v16.size.height = v11;
    Width = CGRectGetWidth(v16);
    v17.origin.x = v8;
    v17.origin.y = v9;
    v17.size.width = v10;
    v17.size.height = v11;
    Height = CGRectGetHeight(v17);
    return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)[_UICollectionLayoutFramesQueryResult alloc], *((_BYTE *)v7 + 8), a2, v7[3], v7[4], v7[5], v7[7], a3, v12, v13, Width, Height);
  }
  return result;
}

- (uint64_t)kindIndexKey
{
  uint64_t *v1;
  void *v2;
  void *v3;
  void *v5;

  v1 = a1;
  if (a1)
  {
    -[_UICollectionLayoutFramesQueryResult auxillaryItem](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_kindIndexKey, v1, CFSTR("_UICollectionLayoutHelpers.m"), 1351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auxillaryItem"));

    }
    objc_msgSend(v2, "elementKind");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, v3, v1[2]);
    v1 = (uint64_t *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

+ (_QWORD)kindIndexKeyForKind:(uint64_t)a3 index:
{
  uint64_t v5;
  _UICollectionLayoutFramesQueryResultElementIndexKey *v6;
  id v7;
  _QWORD *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = objc_opt_self();
  if (objc_msgSend(a2, "length"))
  {
    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_kindIndexKeyForKind_index_, v5, CFSTR("_UICollectionLayoutHelpers.m"), 1357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_kindIndexKeyForKind_index_, v5, CFSTR("_UICollectionLayoutHelpers.m"), 1358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index>=0"));

LABEL_3:
  objc_opt_self();
  v6 = [_UICollectionLayoutFramesQueryResultElementIndexKey alloc];
  if (!v6)
    return 0;
  v12.receiver = v6;
  v12.super_class = (Class)_UICollectionLayoutFramesQueryResultElementIndexKey;
  v7 = objc_msgSendSuper2(&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)v7 + 1, a2);
    v8[2] = a3;
  }
  return v8;
}

- (id)supplementaryItem
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return (id *)v1[5];
    a1 = 0;
  }
  return a1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_frame);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_index);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_zIndex);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resultKind);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: frame=%@; index=%@; zIndex=%@ resultKind=%@"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_supplementaryEnrollmentIdentifier)
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("; supplementaryEnrollmentIdentifier=%@>"),
      self->_supplementaryEnrollmentIdentifier);
  else
    objc_msgSend(v10, "stringByAppendingString:", CFSTR(">"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)+[_UICollectionLayoutFramesQueryResult allocWithZone:](_UICollectionLayoutFramesQueryResult, "allocWithZone:", a3), self->_isFrameAdjustedForPinning, (void *)self->_index, (void *)self->_zIndex, (void *)self->_resultKind, self->_item, (void *)self->_auxillaryKind, self->_supplementaryEnrollmentIdentifier, self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
}

- (id)copyWithOffset:(double)a3
{
  id *v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double Width;
  double Height;
  CGRect v12;
  CGRect v13;

  if (result)
  {
    v3 = result;
    v4 = *((double *)result + 8);
    v5 = *((double *)result + 9);
    v6 = *((double *)result + 10);
    v7 = *((double *)result + 11);
    v8 = a2 + v4;
    v9 = a3 + v5;
    v12.origin.x = v4;
    v12.origin.y = v5;
    v12.size.width = v6;
    v12.size.height = v7;
    Width = CGRectGetWidth(v12);
    v13.origin.x = v4;
    v13.origin.y = v5;
    v13.size.width = v6;
    v13.size.height = v7;
    Height = CGRectGetHeight(v13);
    return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)[_UICollectionLayoutFramesQueryResult alloc], *((_BYTE *)v3 + 8), v3[2], v3[3], v3[4], v3[5], v3[7], v3[6], v8, v9, Width, Height);
  }
  return result;
}

- (id)copyWithIndex:(id *)result
{
  if (result)
    return -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)[_UICollectionLayoutFramesQueryResult alloc], *((_BYTE *)result + 8), a2, result[3], result[4], result[5], result[7], result[6], *((double *)result + 8), *((double *)result + 9), *((double *)result + 10), *((double *)result + 11));
  return result;
}

@end
