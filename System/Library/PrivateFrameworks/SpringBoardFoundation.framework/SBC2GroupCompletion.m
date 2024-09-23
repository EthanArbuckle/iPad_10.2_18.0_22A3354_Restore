@implementation SBC2GroupCompletion

uint64_t __64__SBC2GroupCompletion_perform_finalCompletion_options_delegate___block_invoke()
{
  return 0;
}

+ (void)perform:(id)a3 finalCompletion:(id)a4 options:(unint64_t)a5 delegate:(id)a6
{
  id v9;
  void *v10;
  id v11;
  void (**v12)(id, id);
  id v13;
  void (**v14)(id, _QWORD);
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void (*v16)(void);
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  id v23[2];
  id location;
  _QWORD v25[3];
  char v26;
  _QWORD v27[3];
  char v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[4];

  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 1;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    v12 = (void (**)(id, id))a3;
    objc_initWeak(&location, a6);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ___SubcompletionGenerator_block_invoke;
    v17[3] = &unk_1E200F710;
    objc_copyWeak(v23, &location);
    v20 = v31;
    v21 = v29;
    v22 = v27;
    v23[1] = (id)a5;
    v18 = v11;
    v19 = v25;
    v13 = v11;
    v14 = (void (**)(id, _QWORD))MEMORY[0x18D774178](v17);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
    v14[2](v14, 0);
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, v14);

    v15[2](v15, 1, 0);
  }
  else
  {
    v16 = (void (*)(void))*((_QWORD *)a3 + 2);
    v14 = (void (**)(id, _QWORD))a3;
    v16();
  }

}

+ (void)perform:(id)a3 finalCompletion:(id)a4
{
  objc_msgSend(a1, "perform:finalCompletion:options:delegate:", a3, a4, 0, 0);
}

@end
