@implementation TIAutoshiftController

- (TIAutoshiftController)initWithTextInputTraits:(id)a3
{
  id v5;
  TIAutoshiftController *v6;
  TIAutoshiftController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIAutoshiftController;
  v6 = -[TIAutoshiftController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_textInputTraits, a3);

  return v7;
}

- (unint64_t)actionForDocumentState:(id)a3 inputMangerState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;

  v6 = a3;
  v7 = a4;
  -[TIAutoshiftController textInputTraits](self, "textInputTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "keyboardType");

  if (v9 <= 0xD && ((0x2930u >> v9) & 1) != 0)
    goto LABEL_3;
  if (!-[TIAutoshiftController isEnabled](self, "isEnabled"))
  {
LABEL_7:
    v10 = 1;
    goto LABEL_8;
  }
  -[TIAutoshiftController textInputTraits](self, "textInputTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "autocapitalizationType") == 1)
  {
    objc_msgSend(v6, "markedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
      goto LABEL_7;
  }
  else
  {

  }
  if (!v6)
  {
LABEL_3:
    v10 = 0;
    goto LABEL_8;
  }
  -[TIAutoshiftController textInputTraits](self, "textInputTraits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "autocapitalizationType");

  if (v16 == 1)
  {
    objc_msgSend(v6, "contextBeforeInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "_lastLongCharacter");

    if ((v18 > 0x20 || ((1 << v18) & 0x100000401) == 0) && v18 != 160)
      goto LABEL_21;
LABEL_20:
    v10 = 3;
    goto LABEL_8;
  }
  if (v16 == 3)
    goto LABEL_20;
  if (v16 != 2)
  {
LABEL_21:
    v10 = 4;
    goto LABEL_8;
  }
  if (-[TIAutoshiftController isSelectionAtSentenceAutoshiftBoundaryWithDocumentState:inputManagerState:](self, "isSelectionAtSentenceAutoshiftBoundaryWithDocumentState:inputManagerState:", v6, v7))
  {
    v10 = 3;
  }
  else
  {
    v10 = 4;
  }
LABEL_8:

  return v10;
}

- (BOOL)isSelectionAtSentenceAutoshiftBoundaryWithDocumentState:(id)a3 inputManagerState:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  unsigned int v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a4)
    return objc_msgSend(a4, "nextInputWouldStartSentence", a3);
  v21 = v4;
  v22 = v5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(a3, "contextBeforeInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__TIAutoshiftController_isSelectionAtSentenceAutoshiftBoundaryWithDocumentState_inputManagerState___block_invoke;
  v12[3] = &unk_1E243B260;
  v12[4] = &v13;
  v12[5] = &v17;
  objc_msgSend(v7, "_reverseEnumerateLongCharactersInRange:usingBlock:", 0, v8, v12);
  v9 = v18[3];
  if (v9 <= 2)
  {
    v11 = *((_DWORD *)v14 + 6);
    v10 = 1;
    if (v11 <= 0x3F)
    {
      if (((1 << v11) & 0x100000401) != 0)
        goto LABEL_12;
      if (((1 << v11) & 0x8000400200000000) != 0)
      {
        v10 = v9 != 0;
        goto LABEL_12;
      }
    }
    if (v11 - 160 > 0x1F || ((1 << (v11 + 96)) & 0x80000003) == 0)
      v10 = 0;
    goto LABEL_12;
  }
  v10 = 1;
LABEL_12:

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v10;
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputTraits, 0);
}

uint64_t __99__TIAutoshiftController_isSelectionAtSentenceAutoshiftBoundaryWithDocumentState_inputManagerState___block_invoke(uint64_t result, int a2, _BYTE *a3)
{
  uint64_t v3;
  unint64_t v4;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  if ((a2 & 0xFFFFFF7F) == 0x20
    && (v3 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8), v4 = *(_QWORD *)(v3 + 24), v4 <= 2))
  {
    *(_QWORD *)(v3 + 24) = v4 + 1;
  }
  else
  {
    *a3 = 1;
  }
  return result;
}

@end
