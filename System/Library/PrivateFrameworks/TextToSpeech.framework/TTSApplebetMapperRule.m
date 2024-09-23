@implementation TTSApplebetMapperRule

+ (id)ruleWithHeterogeniousArray:(id)a3
{
  id v3;
  TTSApplebetMapperRule *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;

  v3 = a3;
  v4 = [TTSApplebetMapperRule alloc];
  v9 = (void *)objc_msgSend_init(v4, v5, v6, v7, v8);
  objc_msgSend_objectAtIndexedSubscript_(v3, v10, 0, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLeft_(v9, v14, (uint64_t)v13, v15, v16);

  objc_msgSend_objectAtIndexedSubscript_(v3, v17, 1, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMatch_(v9, v21, (uint64_t)v20, v22, v23);

  objc_msgSend_objectAtIndexedSubscript_(v3, v24, 2, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRight_(v9, v28, (uint64_t)v27, v29, v30);

  objc_msgSend_objectAtIndexedSubscript_(v3, v31, 3, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMatchRule_(v9, v35, (uint64_t)v34, v36, v37);

  objc_msgSend_objectAtIndexedSubscript_(v3, v38, 4, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubstitution_(v9, v42, (uint64_t)v41, v43, v44);

  return v9;
}

- (NSArray)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
  objc_storeStrong((id *)&self->_left, a3);
}

- (NSArray)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (NSArray)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
  objc_storeStrong((id *)&self->_right, a3);
}

- (id)matchRule
{
  return self->_matchRule;
}

- (void)setMatchRule:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)substitution
{
  return self->_substitution;
}

- (void)setSubstitution:(id)a3
{
  objc_storeStrong((id *)&self->_substitution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitution, 0);
  objc_storeStrong(&self->_matchRule, 0);
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

@end
