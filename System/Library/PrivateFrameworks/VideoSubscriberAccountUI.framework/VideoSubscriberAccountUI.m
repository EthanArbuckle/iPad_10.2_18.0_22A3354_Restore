void VSAuthenticationViewControllerViewDidLoad(void *a1)
{
  id v1;

  objc_msgSend(a1, "viewModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setViewState:", 1);

}

void VSAuthenticationViewControllerViewWillAppear(void *a1)
{
  id v1;

  objc_msgSend(a1, "viewModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setViewState:", 2);

}

void VSAuthenticationViewControllerViewDidAppear(void *a1)
{
  id v1;

  objc_msgSend(a1, "viewModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setViewState:", 3);

}

void VSAuthenticationViewControllerViewWillDisappear(void *a1)
{
  id v1;

  objc_msgSend(a1, "viewModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setViewState:", 4);

}

void VSAuthenticationViewControllerViewDidDisappear(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = a1;
  objc_msgSend(v3, "viewModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setViewState:", 5);

  if ((objc_msgSend(v3, "isBeingDismissed") & 1) != 0
    || objc_msgSend(v3, "isMovingFromParentViewController"))
  {
    objc_msgSend(v3, "viewModel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setViewState:", 6);

  }
}

void sub_2303C87B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2303C9DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37,char a38)
{
  uint64_t v38;

  objc_destroyWeak(location);
  objc_destroyWeak(&a37);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 184), 8);
  _Block_object_dispose((const void *)(v38 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_2303CAF04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2303CB450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(a9);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t VSDestinationFromResourceDictionary(void *a1, const char *a2)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("path"));
}

id VSDestinationError(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = *MEMORY[0x24BDD0FD8];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VSDestinationErrorDomain"), a1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id VSIconForBundleWithIdentifier(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  v1 = (void *)MEMORY[0x24BDF6D38];
  v2 = a1;
  objc_msgSend(v1, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  objc_msgSend(MEMORY[0x24BDF6AC8], "_applicationIconImageForBundleIdentifier:format:scale:", v2, 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_2303CDCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_2303CDE84(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2303CDF90(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2303D0CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2303D1330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2303D1B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location,id a32)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void sub_2303D2D8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_2303D3DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void commonInit(void *a1)
{
  id v1;

  v1 = a1;
  VSRequireMainThread();
  objc_msgSend(v1, "_updateTitleTextColor");

}

id VSAlertForError(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedRecoverySuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedRecoveryOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v3, "recoveryAttempter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __VSAlertForError_block_invoke;
    v21[3] = &unk_24FE19F78;
    v25 = v4;
    v22 = v3;
    v23 = v9;
    v24 = v7;
    v10 = v9;
    v11 = v4;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ERROR_DISMISS_BUTTON_TITLE"), 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDF67E8];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __VSAlertForError_block_invoke_3;
    v19[3] = &unk_24FE19FA0;
    v20 = v4;
    v14 = v4;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v11, 0, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v15);

  }
  objc_msgSend(v7, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredAction:", v17);

  return v7;
}

void sub_2303D60D8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_2303D6EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_2303D8A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void commonInit_0(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;

  v7 = a2;
  v8 = a3;
  v9 = (void *)a1[12];
  a1[12] = v7;
  v10 = v7;
  v11 = a4;
  v16 = a1;

  v12 = (void *)v16[10];
  v16[10] = v8;
  v13 = v8;

  v14 = objc_msgSend(v11, "copy");
  v15 = (void *)v16[3];
  v16[3] = v14;

  setDisplayNameIfAvailable(v16);
}

void setDisplayNameIfAvailable(void *a1)
{
  void *v1;
  id *v2;

  v2 = a1;
  VSDisplayNameForBundleWithIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    objc_storeStrong(v2 + 5, v1);

}

void sub_2303DC424(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2303DEB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2303DF310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2303DFC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_2303DFFEC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2303E0B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a52);
  _Unwind_Resume(a1);
}

void sub_2303E19DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_2303E1C2C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2303E31E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2303E583C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v18 - 48));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void commonInit_1(id *a1, void *a2, char a3, double a4, double a5)
{
  id v10;
  id *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  id v15;
  id v16;

  objc_storeStrong(a1 + 34, a2);
  v10 = a2;
  v11 = a1;
  *((_BYTE *)v11 + 256) = a3;
  *((double *)v11 + 37) = a4;
  *((double *)v11 + 38) = a5;
  v12 = (void *)MEMORY[0x24BDD1710];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queueWithName:", v16);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v11[33];
  v11[33] = (id)v14;

}

void sub_2303EA0BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *a16, id *location, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  uint64_t v26;

  objc_destroyWeak(location);
  objc_destroyWeak(a16);
  objc_destroyWeak(&a26);
  objc_destroyWeak((id *)(v26 - 160));
  _Unwind_Resume(a1);
}

void sub_2303EA318(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2303EEB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void commonInit_2(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v1 = (objc_class *)MEMORY[0x24BDD1710];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (void *)*((_QWORD *)v2 + 37);
  *((_QWORD *)v2 + 37) = v3;

  objc_msgSend(*((id *)v2 + 37), "setName:", CFSTR("VSIdentityProviderFetchOperation"));
  v5 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  v6 = (id)*((_QWORD *)v2 + 36);
  *((_QWORD *)v2 + 36) = v5;

}

void sub_2303EF3F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2303F0614(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_2303F0A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2303F1160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2303F1328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void VSExportCompressionToContext(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", CFSTR("VSJavaScriptDataValueTransformer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8C60]), "initWithValueTransformer:", v2);
    objc_msgSend(MEMORY[0x24BDD1970], "valueTransformerForName:", *MEMORY[0x24BDF8DF0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDF8BC0]);
      v28[0] = v2;
      v28[1] = v4;
      v28[2] = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValueTransformers:", v6);

      v22 = v4;
      v7 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v23 = v3;
      v26[2] = __VSExportCompressionToContext_block_invoke;
      v26[3] = &unk_24FE1ACF8;
      v8 = v5;
      v27 = v8;
      v20 = (void *)MEMORY[0x2348B90BC](v26);
      v24[0] = v7;
      v24[1] = 3221225472;
      v24[2] = __VSExportCompressionToContext_block_invoke_2;
      v24[3] = &unk_24FE1ACF8;
      v25 = v8;
      v21 = v8;
      v19 = (void *)MEMORY[0x2348B90BC](v24);
      objc_msgSend(v1, "globalObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v10 = (void *)MEMORY[0x2348B90BC](v20);
      v11 = *MEMORY[0x24BDDA600];
      objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x24BDDA600]);

      v12 = *MEMORY[0x24BDDA608];
      v13 = MEMORY[0x24BDBD1C0];
      objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BDDA608]);
      v14 = *MEMORY[0x24BDDA5E8];
      objc_msgSend(v9, "setObject:forKey:", v13, *MEMORY[0x24BDDA5E8]);
      objc_msgSend(v9, "setObject:forKey:", v13, v14);
      objc_msgSend(v18, "defineProperty:descriptor:", CFSTR("deflate"), v9);
      v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v16 = (void *)MEMORY[0x2348B90BC](v19);
      objc_msgSend(v15, "setObject:forKey:", v16, v11);

      v17 = v12;
      v3 = v23;
      objc_msgSend(v15, "setObject:forKey:", v13, v17);
      objc_msgSend(v15, "setObject:forKey:", v13, v14);
      objc_msgSend(v15, "setObject:forKey:", v13, v14);
      objc_msgSend(v18, "defineProperty:descriptor:", CFSTR("inflate"), v15);

      v4 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Unable to obtain compression value transformer."));
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Unable to obtain data value transformer."));
  }

}

uint64_t VSIsScriptMessageNotificationURL(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    VSScriptMessageNotificationURL();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
    if (v5 && v6)
    {
      if (objc_msgSend(v6, "compare:options:", v5, 1))
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v4, "resourceSpecifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "resourceSpecifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9;
        v12 = v10;
        v13 = v12;
        if (v11 == v12)
        {
          v8 = 1;
        }
        else
        {
          v8 = 0;
          if (v11 && v12)
            v8 = objc_msgSend(v11, "isEqual:", v12);
        }

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id VSScriptMessageNotificationURL()
{
  if (VSScriptMessageNotificationURL___vs_lazy_init_predicate != -1)
    dispatch_once(&VSScriptMessageNotificationURL___vs_lazy_init_predicate, &__block_literal_global_16);
  return (id)VSScriptMessageNotificationURL___vs_lazy_init_variable;
}

id VSScriptMessageSupportInjection(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("VideoSubscriberAccount"), CFSTR("js"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithContentsOfURL:encoding:error:", v3, 4, &v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = CFSTR("ITML");
  if (a1 != 1)
    v5 = 0;
  if (a1)
    v6 = v5;
  else
    v6 = CFSTR("web");
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceUnwrapObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("____VS_MESSAGE_ENVIRONMENT_NAME____"), v8, 0, 0, objc_msgSend(v4, "length"));
  VSScriptMessageNotificationURL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("____VS_MESSAGE_NOTIFICATION_URL____"), v11, 0, 0, objc_msgSend(v4, "length"));

  }
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Unable to obtain script source."));
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The scriptSourceOrNil parameter must not be nil."));
  }

  return v4;
}

id VSScriptMessageDispatchInjection(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v1 = a1;
  objc_msgSend(v1, "body");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@://%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "port");
  if (v10)
  {
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(":%ld"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("'"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(function () {var m = {};m.data = '%@';m.origin = '%@';VideoSubscriberAccount._dispatchMessage(m);})();"),
    v3,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

VSScriptMessage *VSScriptMessageForValueFromContextWithOrigin(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  void *v19;
  id v20;
  VSScriptMessage *v21;
  VSScriptSecurityOrigin *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("target"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = (void *)MEMORY[0x24BDBCE88];
        v9 = *MEMORY[0x24BDBCAB8];
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "raise:format:", v9, CFSTR("Unexpectedly, target was %@, instead of NSString."), v11);

      }
      v12 = v7;
      objc_msgSend(v3, "objectForKey:", CFSTR("body"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v16 = (void *)MEMORY[0x24BDBCE88];
            v17 = *MEMORY[0x24BDBCAB8];
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "raise:format:", v17, CFSTR("Unexpectedly, bodyValue was %@, instead of NSString."), v19);

          }
          v20 = v15;
          v21 = objc_alloc_init(VSScriptMessage);
          -[VSScriptMessage setBody:](v21, "setBody:", v20);

          -[VSScriptMessage setSource:](v21, "setSource:", v4);
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }
      if ((objc_msgSend(v12, "isEqual:", CFSTR("*")) & 1) != 0)
      {
        v22 = 0;
      }
      else if (objc_msgSend(v12, "isEqual:", CFSTR("/")))
      {
        v22 = (VSScriptSecurityOrigin *)v4;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v22 = objc_alloc_init(VSScriptSecurityOrigin);
          objc_msgSend(v23, "scheme");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSScriptSecurityOrigin setScheme:](v22, "setScheme:", v24);

          objc_msgSend(v23, "host");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSScriptSecurityOrigin setHost:](v22, "setHost:", v25);

          objc_msgSend(v23, "port");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSScriptSecurityOrigin setPort:](v22, "setPort:", objc_msgSend(v26, "integerValue"));

        }
        else
        {
          VSErrorLogObject();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            VSScriptMessageForValueFromContextWithOrigin_cold_1((uint64_t)v12, v27);

          v22 = 0;
          v21 = 0;
        }

      }
      -[VSScriptMessage setTarget:](v21, "setTarget:", v22);

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t VSShouldSendScriptMessageToContextWithOrigin(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "body");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v4;
      _os_log_error_impl(&dword_2303C5000, v8, OS_LOG_TYPE_ERROR, "Discarding message (%@) from %@ with target (%@) mis-match for origin: %@", (uint8_t *)&v12, 0x2Au);

    }
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void sub_2303FB88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id VSSpecifierForFooter(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void *)MEMORY[0x24BE75590];
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "emptyGroupSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v11, *MEMORY[0x24BE75A30]);

  v12 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "setProperty:forKey:", v12, CFSTR("VSFooterPrimaryMessage"));

  v13 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v9, "setProperty:forKey:", v13, CFSTR("VSFooterSecondaryMessage"));

  v14 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v9, "setProperty:forKey:", v14, CFSTR("VSFooterTertiaryMessage"));

  return v9;
}

void sub_2303FD660(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2303FDEA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2303FE0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void commonInit_3(void *a1)
{
  objc_class *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v1 = (objc_class *)MEMORY[0x24BDF67D0];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithActivityIndicatorStyle:", 100);
  v4 = (void *)v2[123];
  v2[123] = v3;
  v5 = v3;

  *((_BYTE *)v2 + 969) = 1;
  v6 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v11);
  objc_msgSend(v6, "setMaximumContentSizeCategory:", *MEMORY[0x24BDF7660]);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  objc_msgSend(v6, "setTextAlignment:", 1);
  +[VSLoadingViewController_iOS defaultLoadingTitle](VSLoadingViewController_iOS, "defaultLoadingTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v9);

  v10 = (void *)v2[124];
  v2[124] = v6;

}

__CFString *VSAppSettingsSectionLocalizedTitle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  __CFString *v5;

  v1 = a1;
  if (objc_msgSend(v1, "isEqual:", CFSTR("decided")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("ACCOUNT_ACCESS_DECIDED_GROUP_NAME");
  }
  else if (objc_msgSend(v1, "isEqual:", CFSTR("available")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("ACCOUNT_ACCESS_AVAILABLE_GROUP_NAME");
  }
  else if (objc_msgSend(v1, "isEqual:", CFSTR("subscribed")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("ACCOUNT_ACCESS_SUBSCRIBED_GROUP_NAME");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqual:", CFSTR("upgrade")))
    {
      v5 = &stru_24FE1B848;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("ACCOUNT_ACCESS_AVAILABLE_WITH_UPGRADE_GROUP_NAME");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, 0, 0);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v5;
}

void sub_2303FFA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void commonInit_4(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD *v5;

  v1 = (objc_class *)MEMORY[0x24BDF6AE8];
  v5 = a1;
  v2 = objc_alloc_init(v1);
  objc_msgSend(v2, "setContentMode:", 1);
  v3 = (void *)v5[52];
  v5[52] = v2;
  v4 = v2;

  objc_msgSend(v5, "addSubview:", v4);
}

void commonInit_5(void *a1)
{
  _QWORD *v1;
  VSFontCenter *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = -[VSFontCenter initWithTraitEnvironment:]([VSFontCenter alloc], "initWithTraitEnvironment:", v1);
  v3 = (void *)v1[133];
  v1[133] = v2;

  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v1, "registerForTraitChanges:withHandler:", v4, &__block_literal_global_19);

}

void __commonInit_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a2;
  v5 = a3;
  v17 = v4;
  objc_msgSend(v17, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
  {
    objc_msgSend(v17, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceStyle");

    objc_msgSend(v17, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferredLogoSize");
    objc_msgSend(v17, "vs_updateViewModel:withUserInterfaceStyle:andPreferredLogoSize:", v11, v10);

  }
  objc_msgSend(v17, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v14)
  {
    objc_msgSend(v17, "fontCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "traitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTraitCollection:", v16);

  }
}

void sub_230404ABC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_230404F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_230405368(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_230405D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23040646C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_230406954(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id VSAppDescriptionValueType()
{
  if (VSAppDescriptionValueType___vs_lazy_init_predicate != -1)
    dispatch_once(&VSAppDescriptionValueType___vs_lazy_init_predicate, &__block_literal_global_23);
  return (id)VSAppDescriptionValueType___vs_lazy_init_variable;
}

void sub_2304087E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230408F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;
  id *v34;
  id *v35;
  uint64_t v36;

  objc_destroyWeak(v35);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  objc_destroyWeak(v33);
  objc_destroyWeak(&a28);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v36 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_230409F30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_23040B32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,char a29)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_23040B650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_23040B868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23040CA04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_23040D158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23040D23C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_23040D6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23040EFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23040FA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230410CD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_2304145D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void commonInit_6(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VSFontCenter *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  uint64_t v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  double v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  id v168;
  uint64_t v169;
  void *v170;
  id v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  VSFontCenter *v178;
  id v179;
  void *v180;
  void *v181;
  _QWORD v182[3];

  v182[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  VSRequireMainThread();
  v2 = (void *)*((_QWORD *)v1 + 55);
  *((_QWORD *)v1 + 55) = &stru_24FE1B848;

  v3 = (void *)*((_QWORD *)v1 + 56);
  *((_QWORD *)v1 + 56) = &stru_24FE1B848;

  v4 = (void *)*((_QWORD *)v1 + 57);
  *((_QWORD *)v1 + 57) = &stru_24FE1B848;

  v5 = (void *)*((_QWORD *)v1 + 58);
  *((_QWORD *)v1 + 58) = &stru_24FE1B848;

  v6 = (void *)*((_QWORD *)v1 + 59);
  *((_QWORD *)v1 + 59) = &stru_24FE1B848;

  v7 = (void *)*((_QWORD *)v1 + 60);
  *((_QWORD *)v1 + 60) = &stru_24FE1B848;

  v8 = (void *)*((_QWORD *)v1 + 61);
  *((_QWORD *)v1 + 61) = &stru_24FE1B848;

  v9 = (void *)*((_QWORD *)v1 + 62);
  *((_QWORD *)v1 + 62) = &stru_24FE1B848;

  v10 = (void *)*((_QWORD *)v1 + 65);
  *((_QWORD *)v1 + 65) = &stru_24FE1B848;

  v11 = -[VSFontCenter initWithTraitEnvironment:]([VSFontCenter alloc], "initWithTraitEnvironment:", v1);
  objc_storeStrong((id *)v1 + 66, v11);
  v12 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_storeStrong((id *)v1 + 70, v12);
  objc_msgSend(v12, "setAxis:", 1);
  objc_msgSend(v12, "setAlignment:", 3);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = v12;
  objc_msgSend(v1, "addSubview:", v12);
  v14 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  VSMainConcurrencyBindingOptions();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v11;
  objc_msgSend(v14, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v11, CFSTR("title1Font"), v15);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 76.0, *MEMORY[0x24BDF7868]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v16);

  objc_msgSend(MEMORY[0x24BDF6950], "vsa_opacityBDynamicColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v17);

  objc_msgSend(v14, "setTextAlignment:", 1);
  objc_msgSend(v14, "setLineBreakMode:", 0);
  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  VSMainConcurrencyBindingOptions();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vs_bind:toObject:withKeyPath:options:", CFSTR("text"), v1, CFSTR("title"), v18);

  objc_msgSend(v13, "addArrangedSubview:", v14);
  objc_msgSend(v13, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAllowsGroupBlending:", 0);

  objc_msgSend(v14, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceStyle");

  objc_msgSend(v14, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = *MEMORY[0x24BDE5BD8];
  v25 = *MEMORY[0x24BDE5BD0];
  if (v21 == 2)
    v26 = *MEMORY[0x24BDE5BD8];
  else
    v26 = *MEMORY[0x24BDE5BD0];
  objc_msgSend(v22, "setCompositingFilter:", v26);

  v27 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  VSMainConcurrencyBindingOptions();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v11, CFSTR("headlineFont"), v28);

  objc_msgSend(MEMORY[0x24BDF6950], "vsa_opacityCDynamicColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v29);

  objc_msgSend(v27, "setTextAlignment:", 1);
  objc_msgSend(v27, "setLineBreakMode:", 0);
  objc_msgSend(v27, "setNumberOfLines:", 0);
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  VSMainConcurrencyBindingOptions();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "vs_bind:toObject:withKeyPath:options:", CFSTR("text"), v1, CFSTR("message"), v30);

  objc_msgSend(v13, "addArrangedSubview:", v27);
  objc_msgSend(v27, "traitCollection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "userInterfaceStyle");

  objc_msgSend(v27, "layer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v32 == 2)
    v35 = v24;
  else
    v35 = v25;
  objc_msgSend(v33, "setCompositingFilter:", v35);

  v177 = v27;
  objc_msgSend(v13, "setCustomSpacing:afterView:", v27, 44.0);
  v176 = v14;
  objc_msgSend(v14, "font");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "descender");
  v38 = ceil(v37) + 50.0;

  objc_msgSend(v27, "font");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "ascender");
  v41 = v40;
  objc_msgSend(v27, "font");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "capHeight");
  v44 = v38 - ceil(v41 - v43);

  objc_msgSend(v13, "setCustomSpacing:afterView:", v14, v44);
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)*((_QWORD *)v1 + 71);
  *((_QWORD *)v1 + 71) = v45;
  v47 = v45;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "_setVisualEffectViewEnabled:backgroundColor:", 0, v48);

  objc_msgSend(v47, "addTarget:action:forControlEvents:", v1, sel__beginButtonPressed_, 0x2000);
  objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v49 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTitleColor:forState:", v52, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTitleColor:forState:", v53, 8);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setTitleColor:forState:", v54, 1);

  LODWORD(v55) = 1148846080;
  objc_msgSend(v47, "setContentHuggingPriority:forAxis:", 0, v55);
  objc_msgSend(v47, "titleLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  VSMainConcurrencyBindingOptions();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v11, CFSTR("headlineFont"), v57);

  VSMainConcurrencyBindingOptions();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = v47;
  objc_msgSend(v47, "vs_bind:toObject:withKeyPath:options:", CFSTR("vs_normalTitle"), v1, CFSTR("beginButtonTitle"), v58);

  objc_msgSend(v13, "addArrangedSubview:", v47);
  objc_msgSend(v13, "setCustomSpacing:afterView:", v47, 14.0);
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)*((_QWORD *)v1 + 72);
  *((_QWORD *)v1 + 72) = v59;
  v61 = v59;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "_setVisualEffectViewEnabled:backgroundColor:", 0, v62);

  objc_msgSend(v61, "addTarget:action:forControlEvents:", v1, sel__skipButtonPressed_, 0x2000);
  objc_msgSend(v61, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v63 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setTitleColor:forState:", v66, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setTitleColor:forState:", v67, 8);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setTitleColor:forState:", v68, 1);

  LODWORD(v69) = 1132068864;
  objc_msgSend(v61, "setContentHuggingPriority:forAxis:", 0, v69);
  objc_msgSend(v61, "titleLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setLineBreakMode:", 5);

  -[VSFontCenter headlineFont](v11, "headlineFont");
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)*((_QWORD *)v1 + 67);
  *((_QWORD *)v1 + 67) = v71;

  -[VSFontCenter headlineFont](v11, "headlineFont");
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)*((_QWORD *)v1 + 68);
  *((_QWORD *)v1 + 68) = v73;

  *((_QWORD *)v1 + 69) = 0x402E000000000000;
  VSMainConcurrencyBindingOptions();
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "vs_bind:toObject:withKeyPath:options:", CFSTR("vs_normalTitle"), v1, CFSTR("skipButtonTitle"), v75);

  objc_msgSend(v61, "titleLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  VSMainConcurrencyBindingOptions();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v1, CFSTR("skipButtonFont"), v77);

  v181 = v61;
  objc_msgSend(v13, "addArrangedSubview:", v61);
  objc_msgSend(v13, "setCustomSpacing:afterView:", v61, 20.0);
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)*((_QWORD *)v1 + 73);
  *((_QWORD *)v1 + 73) = v78;
  v80 = v78;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "_setVisualEffectViewEnabled:backgroundColor:", 0, v81);

  objc_msgSend(v80, "addTarget:action:forControlEvents:", v1, sel__appsButtonPressed_, 0x2000);
  objc_msgSend(v80, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v82 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setTitleColor:forState:", v85, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setTitleColor:forState:", v86, 8);

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.8);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setTitleColor:forState:", v87, 1);

  objc_msgSend(v80, "titleLabel");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  VSMainConcurrencyBindingOptions();
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v11, CFSTR("bodyFont"), v89);

  VSMainConcurrencyBindingOptions();
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "vs_bind:toObject:withKeyPath:options:", CFSTR("vs_normalTitle"), v1, CFSTR("appsButtonTitle"), v90);

  VSMainConcurrencyBindingOptions();
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v91, "mutableCopy");

  v93 = *MEMORY[0x24BDD10E0];
  v94 = *MEMORY[0x24BDF8F60];
  v169 = *MEMORY[0x24BDF8F60];
  objc_msgSend(v92, "setObject:forKey:", *MEMORY[0x24BDD10E0], *MEMORY[0x24BDF8F60]);
  v175 = v80;
  objc_msgSend(v80, "vs_bind:toObject:withKeyPath:options:", CFSTR("hidden"), v1, CFSTR("shouldShowAppsButton"), v92);

  objc_msgSend(v80, "_setSpeedBumpEdges:", 1);
  objc_msgSend(v13, "addArrangedSubview:", v80);
  objc_msgSend(v13, "setCustomSpacing:afterView:", v80, 20.0);
  v95 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  v96 = (void *)*((_QWORD *)v1 + 63);
  *((_QWORD *)v1 + 63) = v95;
  v97 = v95;

  objc_msgSend(v97, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v97, "_setSpeedBumpEdges:", 1);
  v174 = v97;
  objc_msgSend(v13, "addArrangedSubview:", v97);
  VSMainConcurrencyBindingOptions();
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = (void *)objc_msgSend(v98, "mutableCopy");

  objc_msgSend(v99, "setObject:forKey:", v93, v94);
  objc_msgSend(v97, "vs_bind:toObject:withKeyPath:options:", CFSTR("hidden"), v1, CFSTR("shouldShowAboutButton"), v99);

  v179 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v13, "addArrangedSubview:", v179);
  v173 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  VSMainConcurrencyBindingOptions();
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "vs_bind:toObject:withKeyPath:options:", CFSTR("text"), v1, CFSTR("footer"), v100);

  VSMainConcurrencyBindingOptions();
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v11, CFSTR("bodyFont"), v101);

  objc_msgSend(MEMORY[0x24BDF6950], "vsa_opacityCDynamicColor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "setTextColor:", v102);

  objc_msgSend(v173, "setTextAlignment:", 1);
  objc_msgSend(v173, "setLineBreakMode:", 0);
  objc_msgSend(v173, "setNumberOfLines:", 0);
  objc_msgSend(v173, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "addArrangedSubview:", v173);
  v103 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  objc_msgSend(v103, "_setContinuousCornerRadius:", 14.0);
  objc_msgSend(v103, "setClipsToBounds:", 1);
  objc_msgSend(v103, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  VSMainConcurrencyBindingOptions();
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "vs_bind:toObject:withKeyPath:options:", CFSTR("image"), v1, CFSTR("image"), v104);

  objc_msgSend(v1, "addSubview:", v103);
  v105 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v105, "setAxis:", 0);
  objc_msgSend(v105, "setAlignment:", 3);
  objc_msgSend(v105, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "addSubview:", v105);
  v106 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v106, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v106, "setTextAlignment:", 1);
  VSMainConcurrencyBindingOptions();
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v106;
  objc_msgSend(v106, "vs_bind:toObject:withKeyPath:options:", CFSTR("text"), v1, CFSTR("appName"), v107);

  VSMainConcurrencyBindingOptions();
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v11, CFSTR("calloutFont"), v108);

  objc_msgSend(v105, "addArrangedSubview:", v106);
  objc_msgSend(v105, "setCustomSpacing:afterView:", v106, 8.0);
  v109 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v109, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v109, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "vsa_opacityCDynamicColor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setTextColor:", v110);

  VSMainConcurrencyBindingOptions();
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "vs_bind:toObject:withKeyPath:options:", CFSTR("text"), v1, CFSTR("appAgeRatingBadge"), v111);

  VSMainConcurrencyBindingOptions();
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v11, CFSTR("appAgeRatingFont"), v112);

  objc_msgSend(v105, "addArrangedSubview:", v109);
  objc_msgSend(v109, "layer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setCornerRadius:", 6.0);

  objc_msgSend(v109, "layer");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setMasksToBounds:", 1);

  objc_msgSend(v109, "layer");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setBorderWidth:", 2.0);

  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v116 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v117 = objc_msgSend(v116, "CGColor");
  objc_msgSend(v109, "layer");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setBorderColor:", v117);

  v119 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v119, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "vsa_opacityCDynamicColor");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setTextColor:", v120);

  objc_msgSend(v119, "setNumberOfLines:", 0);
  v171 = objc_alloc_init(MEMORY[0x24BDF8BB8]);
  objc_msgSend(v171, "setTransformationBlock:", &__block_literal_global_25);
  VSMainConcurrencyBindingOptions();
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = (void *)objc_msgSend(v121, "mutableCopy");

  objc_msgSend(v122, "setObject:forKey:", v171, v169);
  objc_msgSend(v119, "vs_bind:toObject:withKeyPath:options:", CFSTR("attributedText"), v1, CFSTR("footnote"), v122);

  VSMainConcurrencyBindingOptions();
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v11, CFSTR("caption2Font"), v123);

  objc_msgSend(v1, "addSubview:", v119);
  v124 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v13, "centerXAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "leadingAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:constant:", v126, 662.0);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v127);

  objc_msgSend(v13, "centerYAnchor");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "centerYAnchor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "constraintEqualToAnchor:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v131) = 1144733696;
  v170 = v130;
  objc_msgSend(v130, "setPriority:", v131);
  objc_msgSend(v124, "addObject:", v130);
  objc_msgSend(v13, "widthAnchor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "constraintLessThanOrEqualToConstant:", 846.0);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v133);

  objc_msgSend(v180, "heightAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "constraintEqualToConstant:", 75.0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v135);

  objc_msgSend(v181, "heightAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToConstant:", 75.0);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v137);

  objc_msgSend(v180, "widthAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "constraintGreaterThanOrEqualToConstant:", 380.0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v139);

  objc_msgSend(v180, "centerXAnchor");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "constraintEqualToAnchor:", v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v142);

  objc_msgSend(v179, "heightAnchor");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "constraintEqualToConstant:", 5.0);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v144);

  objc_msgSend(v103, "widthAnchor");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "constraintEqualToConstant:", 550.0);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v146);

  objc_msgSend(v103, "heightAnchor");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "constraintEqualToConstant:", 330.0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v148);

  objc_msgSend(v103, "topAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAnchor");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:constant:", v150, 348.0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v151);

  objc_msgSend(v103, "trailingAnchor");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trailingAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "constraintEqualToAnchor:constant:", v153, -138.0);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v154);

  objc_msgSend(v105, "centerXAnchor");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "centerXAnchor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "constraintEqualToAnchor:", v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v157);

  objc_msgSend(v105, "firstBaselineAnchor");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "bottomAnchor");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "constraintEqualToAnchor:constant:", v159, 42.0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v160);

  objc_msgSend(v119, "centerXAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "centerXAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "constraintEqualToAnchor:", v162);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v163);

  objc_msgSend(v119, "firstBaselineAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "lastBaselineAnchor");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "constraintEqualToAnchor:constant:", v165, 36.0);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "addObject:", v166);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v124);
  v182[0] = objc_opt_class();
  v182[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v182, 2);
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = (id)objc_msgSend(v1, "registerForTraitChanges:withHandler:", v167, &__block_literal_global_223);
}

id __commonInit_block_invoke_0(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  void *v5;

  v2 = a2;
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = objc_alloc_init(MEMORY[0x24BDF6748]);
    objc_msgSend(v4, "setLineSpacing:", 7.0);
    objc_msgSend(v4, "setAlignment:", 1);
    objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x24BDF6628]);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v2, v3);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __commonInit_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  id v19;

  v4 = a2;
  v5 = a3;
  v19 = v4;
  objc_msgSend(v19, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(v19, "fontCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTraitCollection:", v10);

  }
  objc_msgSend(v19, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceStyle");
  v13 = objc_msgSend(v5, "userInterfaceStyle");

  if (v12 != v13)
  {
    objc_msgSend(v19, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceStyle");

    objc_msgSend(v19, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = (_QWORD *)MEMORY[0x24BDE5BD8];
    if (v15 != 2)
      v18 = (_QWORD *)MEMORY[0x24BDE5BD0];
    objc_msgSend(v16, "setCompositingFilter:", *v18);

  }
}

void __swiftcall NSURL.init(vsString:)(NSURL_optional *__return_ptr retstr, Swift::String vsString)
{
  id v2;
  void *v3;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_23041AE98();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_initWithVsString_, v3);

}

id NSURL.init(vsString:)(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  sub_23041794C(a1, a2);
  swift_bridgeObjectRelease();
  v3 = (void *)sub_23041AE98();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithString_, v3);

  return v4;
}

uint64_t sub_23041794C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v4 = sub_23041AE8C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v28 = a1;
  v29 = a2;
  v9 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  swift_bridgeObjectRetain();
  v10 = sub_230418034(0x233F2F3A5E5B285ELL, 0xEE002F2F3A292B5DLL, 1);
  swift_bridgeObjectRetain();
  v11 = (void *)sub_23041AE98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v12 = sub_23041AEBC();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_matchesInString_options_range_, v11, 0, 0, v12);

  sub_23041810C();
  v14 = sub_23041AEE0();

  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_23041AF34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v15)
  {

  }
  else
  {
    sub_23041AE74();
    v16 = sub_23041AE80();
    v17 = sub_23041AEEC();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v26 = v24;
      *(_DWORD *)v18 = 136315138;
      v23 = v18 + 4;
      swift_beginAccess();
      v19 = v28;
      v20 = v29;
      swift_bridgeObjectRetain();
      v25 = sub_230418148(v19, v20, &v26);
      sub_23041AEF8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2303C5000, v16, v17, "Missing scheme for URL: %s", v18, 0xCu);
      v21 = v24;
      swift_arrayDestroy();
      MEMORY[0x2348B929C](v21, -1, -1);
      MEMORY[0x2348B929C](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    swift_beginAccess();
    v26 = 0x2F2F3A7370747468;
    v27 = 0xE800000000000000;
    sub_23041AEC8();

    v28 = v26;
    v29 = v27;
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  return v28;
}

id sub_230417D40(void *a1)
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  id v5;

  v2 = sub_23041AEA4();
  sub_23041794C(v2, v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_23041AE98();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(a1, sel_initWithString_, v4);

  return v5;
}

id static NSURL.vs_URL(withString:)()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF48]);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_23041AE98();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithVsString_, v1);

  return v2;
}

id sub_230417E34()
{
  id v0;
  void *v1;
  id v2;

  sub_23041AEA4();
  v0 = objc_allocWithZone(MEMORY[0x24BDBCF48]);
  v1 = (void *)sub_23041AE98();
  v2 = objc_msgSend(v0, sel_initWithVsString_, v1);
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t URL.init(vsString:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E78970);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23041794C(a1, a2);
  swift_bridgeObjectRelease();
  sub_23041AE5C();
  swift_bridgeObjectRelease();
  v9 = sub_23041AE68();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    sub_230417FF4((uint64_t)v8);
    v11 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v8, v9);
    v11 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a3, v11, 1, v9);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348B9254]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230417FF4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E78970);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_230418034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_23041AE98();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_23041AE50();

    swift_willThrow();
  }
  return v6;
}

unint64_t sub_23041810C()
{
  unint64_t result;

  result = qword_255E78978;
  if (!qword_255E78978)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E78978);
  }
  return result;
}

uint64_t sub_230418148(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_230418218(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2304187A8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2304187A8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_230418218(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_23041AF04();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2304183D0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_23041AF1C();
  if (!v8)
  {
    sub_23041AF28();
    __break(1u);
LABEL_17:
    result = sub_23041AF40();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2304183D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_230418464(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23041863C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23041863C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_230418464(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2304185D8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23041AF10();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23041AF28();
      __break(1u);
LABEL_10:
      v2 = sub_23041AED4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23041AF40();
    __break(1u);
LABEL_14:
    result = sub_23041AF28();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2304185D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E78980);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23041863C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E78980);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23041AF40();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2304187A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

VideoSubscriberAccountUI::VSDestination_optional __swiftcall VSDestination.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  VideoSubscriberAccountUI::VSDestination_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23041AF4C();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static VSDestination.allCases.getter()
{
  return &unk_24FE1B6D8;
}

uint64_t VSDestination.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x74754F6E676973;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x6E496E676973;
}

uint64_t sub_2304188A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2304188B4(*a1, *a2);
}

uint64_t sub_2304188B4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x74754F6E676973;
    else
      v3 = 0xD000000000000010;
    if (v2 == 1)
      v4 = 0xE700000000000000;
    else
      v4 = 0x8000000230427D80;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x74754F6E676973;
      else
        v6 = 0xD000000000000010;
      if (v5 == 1)
        v7 = 0xE700000000000000;
      else
        v7 = 0x8000000230427D80;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE600000000000000;
    v3 = 0x6E496E676973;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE600000000000000;
  if (v3 != 0x6E496E676973)
  {
LABEL_21:
    v8 = sub_23041AF58();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2304189C4()
{
  sub_23041AF64();
  sub_23041AEB0();
  swift_bridgeObjectRelease();
  return sub_23041AF70();
}

uint64_t sub_230418A64()
{
  sub_23041AEB0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_230418AE0()
{
  sub_23041AF64();
  sub_23041AEB0();
  swift_bridgeObjectRelease();
  return sub_23041AF70();
}

VideoSubscriberAccountUI::VSDestination_optional sub_230418B7C(Swift::String *a1)
{
  return VSDestination.init(rawValue:)(*a1);
}

void sub_230418B88(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE600000000000000;
  v4 = 0xE700000000000000;
  v5 = 0x74754F6E676973;
  if (v2 != 1)
  {
    v5 = 0xD000000000000010;
    v4 = 0x8000000230427D80;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x6E496E676973;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

void sub_230418BE8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24FE1B700;
}

void VSDestination.init(_:)(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char v21;
  id v22;

  v4 = sub_23041AEA4();
  v6 = v5;
  if (v4 == sub_23041AEA4() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  v9 = sub_23041AF58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  v10 = sub_23041AEA4();
  v12 = v11;
  if (v10 == sub_23041AEA4() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
LABEL_13:

    v14 = 1;
    goto LABEL_11;
  }
  v15 = sub_23041AF58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
    goto LABEL_13;
  v16 = sub_23041AEA4();
  v18 = v17;
  if (v16 == sub_23041AEA4() && v18 == v19)
  {
    v20 = a1;

    v14 = 2;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v21 = sub_23041AF58();
    v22 = a1;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) != 0)
      v14 = 2;
    else
      v14 = 3;
  }
LABEL_11:
  *a2 = v14;
}

__CFString *VSDestination.objcValue.getter()
{
  char *v0;

  return off_24FE1B7B8[*v0];
}

unint64_t sub_230418DD0()
{
  unint64_t result;

  result = qword_253E7AB00;
  if (!qword_253E7AB00)
  {
    result = MEMORY[0x2348B926C](&protocol conformance descriptor for VSDestination, &type metadata for VSDestination);
    atomic_store(result, (unint64_t *)&qword_253E7AB00);
  }
  return result;
}

unint64_t sub_230418E18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255E78988;
  if (!qword_255E78988)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255E78990);
    result = MEMORY[0x2348B926C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255E78988);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348B9260](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VSDestination(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for VSDestination(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_230418F94 + 4 * byte_230422775[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_230418FC8 + 4 * byte_230422770[v4]))();
}

uint64_t sub_230418FC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230418FD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230418FD8);
  return result;
}

uint64_t sub_230418FE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230418FECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_230418FF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230418FF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230419004(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_230419010(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VSDestination()
{
  return &type metadata for VSDestination;
}

void VSScriptMessageForValueFromContextWithOrigin_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2303C5000, a2, OS_LOG_TYPE_ERROR, "Unable to parse target origin: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_23041AE50()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23041AE5C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_23041AE68()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23041AE74()
{
  return MEMORY[0x24BDF8B30]();
}

uint64_t sub_23041AE80()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23041AE8C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23041AE98()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23041AEA4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23041AEB0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23041AEBC()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_23041AEC8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23041AED4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23041AEE0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23041AEEC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23041AEF8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23041AF04()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23041AF10()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23041AF1C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23041AF28()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23041AF34()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23041AF40()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23041AF4C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23041AF58()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23041AF64()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23041AF70()
{
  return MEMORY[0x24BEE4328]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t CFURLRequestSetHTTPCookieStorage()
{
  return MEMORY[0x24BDB73A8]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

size_t JSObjectGetArrayBufferByteLength(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return MEMORY[0x24BDDA590](ctx, object, exception);
}

void *__cdecl JSObjectGetArrayBufferBytesPtr(JSContextRef ctx, JSObjectRef object, JSValueRef *exception)
{
  return (void *)MEMORY[0x24BDDA598](ctx, object, exception);
}

JSTypedArrayType JSValueGetTypedArrayType(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return MEMORY[0x24BDDA690](ctx, value, exception);
}

BOOL JSValueIsObject(JSContextRef ctx, JSValueRef value)
{
  return MEMORY[0x24BDDA6B0](ctx, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x24BDF7700]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t VSCheckEntitlementForTask()
{
  return MEMORY[0x24BDF8DE8]();
}

uint64_t VSDefaultLogObject()
{
  return MEMORY[0x24BDF8DF8]();
}

uint64_t VSDisplayNameForBundleWithIdentifier()
{
  return MEMORY[0x24BDF8E00]();
}

uint64_t VSEnqueueCompletionOperation()
{
  return MEMORY[0x24BDF8E28]();
}

uint64_t VSErrorIsPrivateError()
{
  return MEMORY[0x24BDF8E38]();
}

uint64_t VSErrorIsPublicError()
{
  return MEMORY[0x24BDF8E40]();
}

uint64_t VSErrorLogObject()
{
  return MEMORY[0x24BDF8E48]();
}

uint64_t VSInvalidVerificationTokenError()
{
  return MEMORY[0x24BDF8E58]();
}

uint64_t VSMainConcurrencyBindingOptions()
{
  return MEMORY[0x24BDF8E70]();
}

uint64_t VSMainThreadOperationWithBlock()
{
  return MEMORY[0x24BDF8E78]();
}

uint64_t VSOpenURL()
{
  return MEMORY[0x24BDF8EB8]();
}

uint64_t VSPerformBlockOnMainThread()
{
  return MEMORY[0x24BDF8EC0]();
}

uint64_t VSPerformCompletionHandler()
{
  return MEMORY[0x24BDF8EC8]();
}

uint64_t VSPrivacyServiceInterface()
{
  return MEMORY[0x24BDF8ED0]();
}

uint64_t VSPrivateAccountDeletionErrorWithRecoveryHandler()
{
  return MEMORY[0x24BDF8ED8]();
}

uint64_t VSPrivateAccountValidationErrorWithRecoveryHandler()
{
  return MEMORY[0x24BDF8EE0]();
}

uint64_t VSPrivateError()
{
  return MEMORY[0x24BDF8EE8]();
}

uint64_t VSPrivateViewServiceCrashedErrorWithRecoveryHandler()
{
  return MEMORY[0x24BDF8EF0]();
}

uint64_t VSPublicError()
{
  return MEMORY[0x24BDF8EF8]();
}

uint64_t VSPublicErrorWithDetailedErrors()
{
  return MEMORY[0x24BDF8F00]();
}

uint64_t VSPublicProviderRejectedError()
{
  return MEMORY[0x24BDF8F08]();
}

uint64_t VSPublicServiceTemporarilyUnavailableError()
{
  return MEMORY[0x24BDF8F10]();
}

uint64_t VSPublicUnsupportedProviderError()
{
  return MEMORY[0x24BDF8F18]();
}

uint64_t VSRequireKeyedCoder()
{
  return MEMORY[0x24BDF8F20]();
}

uint64_t VSRequireMainThread()
{
  return MEMORY[0x24BDF8F28]();
}

uint64_t VSSharedSAMLParserController()
{
  return MEMORY[0x24BDF8F30]();
}

uint64_t VSValueTypeCopyWithZone()
{
  return MEMORY[0x24BDF8F68]();
}

uint64_t VSValueTypeDescription()
{
  return MEMORY[0x24BDF8F70]();
}

uint64_t VSValueTypeEncodeWithCoder()
{
  return MEMORY[0x24BDF8F78]();
}

uint64_t VSValueTypeHash()
{
  return MEMORY[0x24BDF8F80]();
}

uint64_t VSValueTypeInit()
{
  return MEMORY[0x24BDF8F88]();
}

uint64_t VSValueTypeInitWithCoder()
{
  return MEMORY[0x24BDF8F90]();
}

uint64_t VSValueTypeIsEqual()
{
  return MEMORY[0x24BDF8F98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADFF0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

