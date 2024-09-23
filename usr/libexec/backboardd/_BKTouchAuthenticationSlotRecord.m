@implementation _BKTouchAuthenticationSlotRecord

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[BKSTouchAuthenticationSpecification slotID](self->_authenticationSpecification, "slotID")));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  unsigned int v8;
  BOOL v9;

  v5 = objc_opt_class(_BKTouchAuthenticationSlotRecord, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0)
    return 0;
  if (a3)
    v6 = (void *)*((_QWORD *)a3 + 2);
  else
    v6 = 0;
  v7 = v6;
  v8 = objc_msgSend(v7, "slotID");
  v9 = v8 == -[BKSTouchAuthenticationSpecification slotID](self->_authenticationSpecification, "slotID");

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationSpecification, 0);
}

@end
