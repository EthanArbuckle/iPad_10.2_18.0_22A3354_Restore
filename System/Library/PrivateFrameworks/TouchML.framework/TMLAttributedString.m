@implementation TMLAttributedString

- (TMLAttributedString)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TMLAttributedString;
  return -[TMLAttributedString init](&v3, sel_init);
}

- (TMLAttributedString)initWithAttributedString:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  TMLAttributedString *v8;
  double v9;
  uint64_t v10;
  NSMutableAttributedString *attributedString;

  v4 = a3;
  v8 = (TMLAttributedString *)objc_msgSend_init(self, v5, v6);
  if (v8)
  {
    v10 = objc_msgSend_mutableCopy(v4, v7, v9);
    attributedString = v8->_attributedString;
    v8->_attributedString = (NSMutableAttributedString *)v10;

  }
  return v8;
}

- (TMLAttributedString)attributedStringWithAttachment:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  double v7;
  NSMutableAttributedString *v8;
  NSMutableAttributedString *attributedString;
  const char *v10;
  double v11;

  objc_msgSend_attributedStringWithAttachment_(MEMORY[0x24BDD1458], a2, v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (NSMutableAttributedString *)objc_msgSend_mutableCopy(v5, v6, v7);
  attributedString = self->_attributedString;
  self->_attributedString = v8;

  return (TMLAttributedString *)objc_msgSend_NSAttributedString(self, v10, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  return (id)objc_msgSend_initWithAttributedString_(v8, v9, v10, self->_attributedString);
}

- (NSString)string
{
  double v2;

  return (NSString *)objc_msgSend_string(self->_attributedString, a2, v2);
}

- (void)setString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  double v8;
  NSMutableAttributedString *v9;
  NSMutableAttributedString *attributedString;

  v4 = (objc_class *)MEMORY[0x24BDD1688];
  v5 = a3;
  v6 = [v4 alloc];
  v9 = (NSMutableAttributedString *)objc_msgSend_initWithString_(v6, v7, v8, v5);

  attributedString = self->_attributedString;
  self->_attributedString = v9;

}

- (id)NSAttributedString
{
  double v2;

  return (id)objc_msgSend_copy(self->_attributedString, a2, v2);
}

- (unint64_t)length
{
  double v2;

  return objc_msgSend_length(self->_attributedString, a2, v2);
}

- (void)addAttributes:(id)a3 range:(_NSRange)a4
{
  double v4;

  objc_msgSend_addAttributes_range_(self->_attributedString, a2, v4, a3, a4.location, a4.length);
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  double v5;

  objc_msgSend_addAttribute_value_range_(self->_attributedString, a2, v5, a3, a4, a5.location, a5.length);
}

+ (void)initializeJSContext:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v4 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_22AD23DD0;
  v21[3] = &unk_24F4FDA88;
  v21[4] = a1;
  v5 = a3;
  v6 = (void *)MEMORY[0x22E2E7E44](v21);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v7, v8, v6, CFSTR("attributedstring"));

  objc_msgSend_objectForKeyedSubscript_(v5, v9, v10, CFSTR("attributedstring"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v11, v12, v13, &unk_24F4FDAC8, CFSTR("attributes"));

  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = sub_22AD23ED4;
  v20[3] = &unk_24F4FDAE8;
  v20[4] = a1;
  v14 = (void *)MEMORY[0x22E2E7E44](v20);
  objc_msgSend_objectForKeyedSubscript_(v5, v15, v16, CFSTR("attributedstring"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v17, v18, v19, v14, CFSTR("markdown"));
}

+ (id)attributedStringWithFormat:(id)a3 attributes:(id)a4
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  id v16;
  const char *v17;
  double v18;
  void *v19;
  id v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *length;
  double v27;
  unint64_t v28;
  NSUInteger v29;
  NSUInteger location;
  int v31;
  NSUInteger v32;
  int v33;
  int v34;
  int v35;
  int v36;
  const char *v37;
  double v38;
  NSRange v39;
  const char *v40;
  id v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  char isEqualToString;
  const char *v47;
  double v48;
  const char *v49;
  double v50;
  uint64_t v51;
  const char *v52;
  double v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  double v57;
  uint64_t v58;
  const char *v59;
  double v60;
  uint64_t v61;
  const char *v62;
  double v63;
  void *v64;
  const char *v65;
  double v66;
  const char *v67;
  double v68;
  void *v69;
  uint64_t v70;
  const char *v71;
  double v72;
  void *v73;
  const char *v74;
  double v75;
  const char *v76;
  double v77;
  void *v78;
  const char *v79;
  double v80;
  void *v81;
  const char *v82;
  double v83;
  TMLAttributedString_Attributes *v84;
  const char *v85;
  double v86;
  const char *v87;
  double v88;
  uint64_t v89;
  id v90;
  const char *v91;
  double v92;
  void *v93;
  const char *v94;
  double v95;
  id v96;
  id v97;
  id v98;
  const char *v99;
  double v100;
  const char *v101;
  double v102;
  void *v103;
  id v104;
  id v106;
  void *v107;
  _QWORD v108[4];
  id v109;
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  NSRange v114;
  NSRange v115;

  v5 = a4;
  v8 = (void *)objc_msgSend_mutableCopy(a3, v6, v7);
  v9 = objc_alloc(MEMORY[0x24BDD16A8]);
  v12 = objc_msgSend_length(v8, v10, v11);
  v15 = (void *)objc_msgSend_initWithCapacity_(v9, v13, v14, v12);
  v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v19 = (void *)objc_msgSend_initWithCapacity_(v16, v17, v18, 16);
  v20 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v107 = (void *)objc_msgSend_initWithCapacity_(v20, v21, v22, 16);
  v25 = objc_msgSend_length(v8, v23, v24);
  if (!v25)
    goto LABEL_29;
  v28 = v25;
  v106 = v5;
  v29 = 0;
  location = 0;
  v31 = 0;
  v32 = 0;
  v33 = 32;
  do
  {
    v34 = objc_msgSend_characterAtIndex_(v8, length, v27, v32, v106);
    v35 = v34;
    switch(v34)
    {
      case '/':
        if (v31 != 1)
          goto LABEL_12;
        v36 = 2;
        break;
      case ']':
        if (v33 == 92)
          goto LABEL_9;
        v36 = 0;
        if (v31 && v29)
        {
          objc_msgSend_substringWithRange_(v8, length, v27, location, v29);
          v41 = (id)objc_claimAutoreleasedReturnValue();
          if (v31 == 1
            && (objc_msgSend_substringWithRange_(v8, v40, v42, location - 1, 1),
                v43 = (void *)objc_claimAutoreleasedReturnValue(),
                isEqualToString = objc_msgSend_isEqualToString_(v43, v44, v45, CFSTR("/")),
                v43,
                (isEqualToString & 1) == 0))
          {
            v69 = (void *)MEMORY[0x24BDD1968];
            v70 = objc_msgSend_length(v15, v47, v48);
            objc_msgSend_valueWithRange_(v69, v71, v72, v70, 0);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v19, v74, v75, v73);

            objc_msgSend_addObject_(v107, v76, v77, v41);
          }
          else
          {
            v112[0] = MEMORY[0x24BDAC760];
            v112[1] = 3221225472;
            v112[2] = sub_22AD24480;
            v112[3] = &unk_24F4FDB10;
            v41 = v41;
            v113 = v41;
            v51 = objc_msgSend_indexOfObjectWithOptions_passingTest_(v107, v49, v50, 2, v112);
            if (v51 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v54 = v51;
              objc_msgSend_objectAtIndexedSubscript_(v19, v52, v53, v51);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_msgSend_rangeValue(v55, v56, v57);

              v61 = objc_msgSend_length(v15, v59, v60);
              objc_msgSend_valueWithRange_(MEMORY[0x24BDD1968], v62, v63, v58, v61 - v58);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_replaceObjectAtIndex_withObject_(v19, v65, v66, v54, v64);

            }
          }
          v36 = 0;
          goto LABEL_24;
        }
        break;
      case '[':
        if (v33 == 92)
        {
LABEL_9:
          objc_msgSend_deleteCharactersInRange_(v8, length, v27, --v32, 1);
          v28 = objc_msgSend_length(v8, v37, v38);
LABEL_12:
          v114.location = location;
          v114.length = v29;
          v115.location = v32;
          v115.length = 1;
          v39 = NSUnionRange(v114, v115);
          length = (const char *)v39.length;
          location = v39.location;
          v29 = v39.length;
          ++v32;
          goto LABEL_26;
        }
        v36 = 1;
        break;
      default:
        goto LABEL_12;
    }
    if (v29)
    {
      objc_msgSend_substringWithRange_(v8, length, v27, location, v29);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v15, v67, v68, v41);
LABEL_24:

    }
    v29 = 0;
    ++v32;
    v31 = v36;
    location = v32;
LABEL_26:
    v33 = v35;
  }
  while (v32 < v28);
  v5 = v106;
  if (v29)
  {
    objc_msgSend_substringWithRange_(v8, length, v27, location, v29);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v15, v79, v80, v78);

  }
LABEL_29:
  objc_msgSend_objectForKey_(v5, length, v27, &stru_24F505EA8);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v81, v82, v83))
  {
    v84 = objc_alloc_init(TMLAttributedString_Attributes);
    objc_msgSend_setValuesForKeysWithDictionary_(v84, v85, v86, v81);
    objc_msgSend_attributes(v84, v87, v88);
    v89 = objc_claimAutoreleasedReturnValue();

    v81 = (void *)v89;
  }
  v90 = objc_alloc(MEMORY[0x24BDD1688]);
  v93 = (void *)objc_msgSend_initWithString_attributes_(v90, v91, v92, v15, v81);
  objc_msgSend_beginEditing(v93, v94, v95);
  v108[0] = MEMORY[0x24BDAC760];
  v108[1] = 3221225472;
  v108[2] = sub_22AD244AC;
  v108[3] = &unk_24F4FDB38;
  v109 = v19;
  v110 = v5;
  v96 = v93;
  v111 = v96;
  v97 = v5;
  v98 = v19;
  objc_msgSend_enumerateObjectsUsingBlock_(v107, v99, v100, v108);
  objc_msgSend_endEditing(v96, v101, v102);
  v103 = v111;
  v104 = v96;

  return v104;
}

- (id)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v9;
  id v10;
  id v11;
  NSMutableAttributedString *attributedString;
  id v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  length = a4.length;
  location = a4.location;
  v9 = (objc_class *)MEMORY[0x24BDBCEB8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  attributedString = self->_attributedString;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_22AD24658;
  v20[3] = &unk_24F4FDB60;
  v21 = v11;
  v13 = v11;
  objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(attributedString, v14, v15, v10, location, length, a5, v20);

  v18 = (void *)objc_msgSend_copy(v13, v16, v17);
  return v18;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  double v4;

  objc_msgSend_replaceCharactersInRange_withString_(self->_attributedString, a2, v4, a3.location, a3.length, a4);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  ((void (*)(NSMutableAttributedString *, char *))MEMORY[0x24BEDD108])(self->_attributedString, sel_setAttributes_range_);
}

- (void)removeAttribute:(id)a3 range:(_NSRange)a4
{
  ((void (*)(NSMutableAttributedString *, char *))MEMORY[0x24BEDD108])(self->_attributedString, sel_removeAttribute_range_);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  const char *v7;
  double v8;
  NSMutableAttributedString *attributedString;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  id v15;

  length = a3.length;
  location = a3.location;
  v15 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    attributedString = self->_attributedString;
    objc_msgSend_NSAttributedString(v15, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_replaceCharactersInRange_withAttributedString_(attributedString, v11, v12, location, length, v10);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_replaceCharactersInRange_withAttributedString_(self->_attributedString, v13, v14, location, length, v15);
  }

}

- (void)insertAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  const char *v6;
  double v7;
  NSMutableAttributedString *attributedString;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  id v14;

  v14 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    attributedString = self->_attributedString;
    objc_msgSend_NSAttributedString(v14, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertAttributedString_atIndex_(attributedString, v10, v11, v9, a4);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_insertAttributedString_atIndex_(self->_attributedString, v12, v13, v14, a4);
  }

}

- (void)appendAttributedString:(id)a3
{
  const char *v4;
  double v5;
  NSMutableAttributedString *attributedString;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    attributedString = self->_attributedString;
    objc_msgSend_NSAttributedString(v12, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendAttributedString_(attributedString, v8, v9, v7);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_appendAttributedString_(self->_attributedString, v10, v11, v12);
  }

}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  double v3;

  objc_msgSend_deleteCharactersInRange_(self->_attributedString, a2, v3, a3.location, a3.length);
}

- (CGSize)size
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  objc_msgSend_size(self->_attributedString, a2, v2);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)boundingRectWithSize:(CGSize)a3 options:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  MEMORY[0x24BEDD108](self->_attributedString, sel_boundingRectWithSize_options_context_, a3.width);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (NSAttributedString)attributedString
{
  return &self->_attributedString->super;
}

- (void)setAttributedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
