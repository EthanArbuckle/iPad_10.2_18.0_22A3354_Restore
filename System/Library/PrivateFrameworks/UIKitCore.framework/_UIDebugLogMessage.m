@implementation _UIDebugLogMessage

- (_UIDebugLogMessage)initWithString:(id)a3 attributedString:(id)a4
{
  unint64_t v8;
  unint64_t v9;
  _UIDebugLogMessage *v10;
  _UIDebugLogMessage *v11;
  void *v13;
  objc_super v14;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDebugLogTree.m"), 70, CFSTR("At least one representation needs to be specified."));

  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDebugLogMessage;
  v10 = -[_UIDebugLogMessage init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    objc_storeStrong((id *)&v11->_attributedString, a4);
  }

  return v11;
}

+ (id)messageWithNewline
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:attributedString:", &stru_1E16EDF20, 0);
}

+ (id)messageWithString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIDebugLogTree.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:attributedString:", v6, 0);
  return v7;
}

+ (id)messageWithFormat:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIDebugLogTree.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("format"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v5, &v10);
  objc_msgSend(a1, "messageWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)messageWithPrefix:(id)a3 color:(id)a4 string:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIDebugLogTree.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefix"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIDebugLogTree.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

LABEL_3:
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v15 = *(_QWORD *)off_1E1678D98;
      v30[0] = *(_QWORD *)off_1E16790B0;
      v30[1] = v15;
      v31[0] = &unk_1E1A95CE0;
      v31[1] = v10;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = (void **)v31;
      v18 = v30;
      v19 = 2;
    }
    else
    {
      v28 = *(_QWORD *)off_1E16790B0;
      v29 = &unk_1E1A95CE0;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v29;
      v18 = &v28;
      v19 = 1;
    }
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) "), v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v22, v21);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
    objc_msgSend(v23, "appendAttributedString:", v24);

    v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:attributedString:", 0, v23);
  }
  else
  {
    objc_msgSend(a1, "messageWithString:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
  }

  return v20;
}

+ (id)messageWithStyle:(unint64_t)a3 string:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(a3)
  {
    case 0uLL:
      v8 = v6;
      goto LABEL_4;
    case 1uLL:
      v10 = objc_alloc(MEMORY[0x1E0CB3498]);
      v28 = *(_QWORD *)off_1E16790B0;
      v29[0] = &unk_1E1A95CE0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "initWithString:attributes:", v7, v11);

      v8 = 0;
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(info) %@"), v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x1E0CB3498]);
      v26 = *(_QWORD *)off_1E1678D98;
      +[UIColor systemBlueColor](UIColor, "systemBlueColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v13;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v27;
      v16 = &v26;
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(warning) %@"), v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x1E0CB3498]);
      v24 = *(_QWORD *)off_1E1678D98;
      +[UIColor systemYellowColor](UIColor, "systemYellowColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v13;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = &v25;
      v16 = &v24;
LABEL_8:
      v17 = 1;
      goto LABEL_10;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(error) %@"), v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc(MEMORY[0x1E0CB3498]);
      v18 = *(_QWORD *)off_1E1678D98;
      v22[0] = *(_QWORD *)off_1E16790B0;
      v22[1] = v18;
      v23[0] = &unk_1E1A95CE0;
      +[UIColor systemRedColor](UIColor, "systemRedColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v13;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = (void **)v23;
      v16 = v22;
      v17 = 2;
LABEL_10:
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v12, "initWithString:attributes:", v7, v19);

      break;
    default:
      v8 = 0;
LABEL_4:
      v9 = 0;
      break;
  }
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:attributedString:", v8, v9);

  return v20;
}

- (BOOL)_isNode
{
  return 0;
}

- (BOOL)_isTransparent
{
  return 0;
}

- (id)_stringRepresentation
{
  NSString *string;

  string = self->_string;
  if (string)
    return string;
  -[NSAttributedString string](self->_attributedString, "string");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_attributedStringRepresentation
{
  NSAttributedString *attributedString;
  NSAttributedString *v3;

  attributedString = self->_attributedString;
  if (attributedString)
    v3 = attributedString;
  else
    v3 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_string);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
