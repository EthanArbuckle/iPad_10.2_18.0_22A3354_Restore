uint64_t _setModifierCharMap(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setModifierCharMap");
}

void sub_2494762AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2494776F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_249477A60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
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

uint64_t currentKeyboardPlaneIsSameAs(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = a1;
  if (v1)
  {
    -[objc_class getVisibleKeyplaneName](+[TypistKeyboardData keyboardData](TypistKeyboardData, "keyboardData"), "getVisibleKeyplaneName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "containsString:", CFSTR("_")))
    {
      objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("_"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lowercaseString");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    objc_msgSend(v1, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
      TYLogl(OS_LOG_TYPE_ERROR, CFSTR("Unexpected keyboard plane: [%@]. Waiting for: [%@]"), v8, v9, v10, v11, v12, v13, (char)v2);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t _choose(int a1, int a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 0;
  if ((a2 & 0x80000000) == 0 && a1 >= a2)
  {
    if (a1 - a2 >= a2)
      v3 = a2;
    else
      v3 = a1 - a2;
    if (v3 < 1)
    {
      return 1;
    }
    else
    {
      v4 = (v3 + 1);
      v5 = 1;
      v2 = 1;
      do
        v2 = v2 * a1-- / v5++;
      while (v4 != v5);
    }
  }
  return v2;
}

void getTouchPoints(void *a1, int *a2)
{
  id v3;
  double *v4;
  int v5;
  void *v6;
  uint64_t v7;
  double (**v8)(_QWORD, double);
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[4];
  _QWORD v18[3];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = (double *)*((_QWORD *)a2 + 1);
  v5 = *a2;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __getTouchPoints_block_invoke;
  v16[3] = &__block_descriptor_40_e8_d16__0d8l;
  v16[4] = 0x3FD5555555555555;
  v8 = (double (**)(_QWORD, double))MEMORY[0x2495B14D4](v16);
  switch(v5)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *v4, v4[1]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);
      goto LABEL_11;
    case 1:
      v19[0] = v6;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *v4, v4[1]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 1.0;
      goto LABEL_9;
    case 2:
      v18[0] = v6;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *v4, v4[1]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v10;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v4[2], v4[3]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v17[0] = v6;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *v4, v4[1]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v10;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v4[2], v4[3]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v12;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v4[4], v4[5]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[3] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      v11 = 0.333333333;
LABEL_9:

      if (v9)
      {
        do
        {
          v14 = (void *)MEMORY[0x24BDD1968];
          +[TypistPathUtilities pointOnCurve:atTime:](TypistPathUtilities, "pointOnCurve:atTime:", v9, v11);
          objc_msgSend(v14, "valueWithCGPoint:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v15);

          v11 = v8[2](v8, v11);
        }
        while (v11 <= 1.0);
LABEL_11:

      }
      break;
    default:
      break;
  }

}

double __getTouchPoints_block_invoke(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) + a2;
}

void sub_249481B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494827F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
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

void sub_249486D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_249489318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24948B960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_24948E0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_24948E31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24948E444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

void sub_24948E850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_24948EA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24948ED34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24948F20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Block_object_dispose((const void *)(v39 - 112), 8);
  _Unwind_Resume(a1);
}

id getITTKeyboardProxyClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getITTKeyboardProxyClass_softClass;
  v7 = getITTKeyboardProxyClass_softClass;
  if (!getITTKeyboardProxyClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getITTKeyboardProxyClass_block_invoke;
    v3[3] = &unk_251A7C9D8;
    v3[4] = &v4;
    __getITTKeyboardProxyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24948FEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494902B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ___inputTeletypeIsLinked_block_invoke()
{
  id result;

  result = getITTKeyboardProxyClass();
  _inputTeletypeIsLinked_linked = result != 0;
  return result;
}

Class __getITTKeyboardProxyClass_block_invoke(uint64_t a1)
{
  Class result;

  InputTeletypeLibrary();
  result = objc_getClass("ITTKeyboardProxy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getITTKeyboardProxyClass_block_invoke_cold_1();
  getITTKeyboardProxyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void InputTeletypeLibrary()
{
  void *v0;

  if (!InputTeletypeLibraryCore_frameworkLibrary)
    InputTeletypeLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!InputTeletypeLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getITTKeyboardConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  InputTeletypeLibrary();
  result = objc_getClass("ITTKeyboardConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getITTKeyboardConfigurationClass_block_invoke_cold_1();
  getITTKeyboardConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2494913D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_2494918EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 208), 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

unint64_t TYMakeArabicCharacter(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return (a3 << 32) | (a4 << 48) | ((unint64_t)a2 << 16) | a1;
}

void sub_249496768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _shouldNotTapArrowKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v1 = a1;
  objc_msgSend(CFSTR("0123456789↨☻"), "stringByAppendingFormat:", CFSTR("%@%@%@"), CFSTR("⌫"), CFSTR("⏎"), CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_24949D818(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x280], 8);
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

void sub_24949E48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24949FD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A00A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A029C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2494A04C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A064C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A0C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A0FCC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2494A10A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A11F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A1320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A15F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A1720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A1970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2494A2094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Unwind_Resume(exception_object);
}

void sub_2494A3744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_2494A3A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A41D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

void sub_2494A4AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

void sub_2494A5954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;

  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_2494A5ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A695C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A6B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A6C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A6DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A6F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494A7460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_2494A76F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2494A7F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_2494AA480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_2494AB184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2494AB42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id TYLogFramework()
{
  if (TYLogFramework_onceToken != -1)
    dispatch_once(&TYLogFramework_onceToken, &__block_literal_global_13);
  return (id)TYLogFramework___logObj;
}

void _TYLogl(os_log_type_t a1, void *a2, va_list a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v5 = (objc_class *)MEMORY[0x24BDD17C8];
    v6 = a2;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, a3);

    v8 = objc_retainAutorelease(v7);
    v9 = objc_msgSend(v8, "UTF8String");
    TYLogFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, a1))
    {
      *(_DWORD *)buf = 136315138;
      v19 = v9;
      _os_log_impl(&dword_249470000, v10, a1, "%s", buf, 0xCu);
    }

    if (_logToSTDERR)
    {
      objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("%"), CFSTR("%%"), 0, 0, objc_msgSend(v8, "length"));
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSLogv(v11, a3);

    }
    if (_logFileHandle)
    {
      if (_logToFile)
      {
        v12 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(v12, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringFromDate:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@\n"), v14, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)_logFileHandle;
        objc_msgSend(v15, "dataUsingEncoding:", 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "writeData:", v17);

        objc_msgSend((id)_logFileHandle, "synchronizeFile");
        v8 = v15;
      }
    }

  }
}

void TYLogl(os_log_type_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a2)
    _TYLogl(a1, a2, &a9);
}

void TYLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
    _TYLogl(OS_LOG_TYPE_DEBUG, a1, &a9);
}

void sub_2494AC2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

_QWORD *sub_2494ACAC8(_QWORD *a1)
{
  return sub_2494AD5E0(a1);
}

TypistMathSupport __swiftcall TypistMathSupport.init()()
{
  return (TypistMathSupport)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id TypistMathSupport.init()()
{
  objc_super v1;

  v1.super_class = (Class)TypistMathSupport;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_2494ACC40(double a1, double a2, double a3, double a4)
{
  _QWORD **v4;
  _QWORD **v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t result;
  unint64_t v22;
  unint64_t v23;
  double *v24;

  v5 = v4;
  sub_2494ADF2C();
  sub_2494ADF20();
  v10 = sub_2494ADFF8();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  swift_bridgeObjectRelease();
  v17 = MEMORY[0x2495B0DFC](v10, v12, v14, v16);
  v19 = v18;
  swift_bridgeObjectRelease();
  v20 = *v5;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_2494ACE9C(0, v20[2] + 1, 1, v20);
    v20 = (_QWORD *)result;
  }
  v23 = v20[2];
  v22 = v20[3];
  if (v23 >= v22 >> 1)
  {
    result = (uint64_t)sub_2494ACE9C((_QWORD *)(v22 > 1), v23 + 1, 1, v20);
    v20 = (_QWORD *)result;
  }
  v20[2] = v23 + 1;
  v24 = (double *)&v20[6 * v23];
  *((_QWORD *)v24 + 4) = v17;
  *((_QWORD *)v24 + 5) = v19;
  v24[6] = a1;
  v24[7] = a2;
  v24[8] = a3;
  v24[9] = a4;
  *v5 = v20;
  return result;
}

_QWORD *sub_2494ACD7C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257866B30);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257866B08);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_2494ACE9C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257866B40);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[6 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 48 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257866B48);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_2494ACFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2494AE058();
  sub_2494ADFE0();
  v4 = sub_2494AE064();
  return sub_2494AD34C(a1, a2, v4);
}

uint64_t sub_2494AD038(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _OWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257866B28);
  v38 = a2;
  v6 = sub_2494AE028();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v14;
    if (!v25)
    {
      v14 = v23 + 1;
      if (v23 + 1 >= v11)
        goto LABEL_33;
      v25 = *(_QWORD *)(v37 + 8 * v14);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v14 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v25 = *(_QWORD *)(v37 + 8 * v14);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v14 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = (__int128 *)(*(_QWORD *)(v5 + 56) + 32 * v22);
    v39 = *v34;
    v40 = v34[1];
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_2494AE058();
    sub_2494ADFE0();
    result = sub_2494AE064();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v17 == v28;
        if (v17 == v28)
          v17 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v33;
    v19[1] = v32;
    v20 = (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v18);
    *v20 = v39;
    v20[1] = v40;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_2494AD34C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2494AE034() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2494AE034() & 1) == 0);
    }
  }
  return v6;
}

void *sub_2494AD42C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 *v21;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  _OWORD *v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257866B28);
  v2 = *v0;
  v3 = sub_2494AE01C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = (__int128 *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v23 = *v21;
    v24 = v21[1];
    *v22 = v19;
    v22[1] = v18;
    v25 = (_OWORD *)(*(_QWORD *)(v4 + 56) + v20);
    *v25 = v23;
    v25[1] = v24;
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_2494AD5E0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  _QWORD *result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  char v39;
  unint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t *v49;
  _QWORD *v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  _QWORD *v71;
  unint64_t v72;
  unint64_t v73;
  _QWORD *v74;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257866B10);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v65 = (char *)&v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2494ADF80();
  v4 = *(_QWORD *)(v3 - 8);
  v68 = v3;
  v69 = v4;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v70 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2494ADF68();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257866B18);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2494ADF44();
  v66 = *(_QWORD *)(v8 - 8);
  v67 = v8;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2494ADEFC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v60 - v16;
  sub_2494ADEF0();
  sub_2494ADEE4();
  swift_bridgeObjectRetain();
  sub_2494ADF5C();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v18 = v71;
  sub_2494ADF50();
  if (v18)
    return (_QWORD *)(*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  v61 = v10;
  v62 = v17;
  v63 = v12;
  v64 = v11;
  v21 = (uint64_t)v65;
  v20 = v66;
  v71 = a1;
  v22 = v67;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v7, 1, v67) == 1)
  {
    sub_2494ADC94((uint64_t)v7, &qword_257866B18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257866B20);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_2494B1DF0;
    v72 = 0;
    v73 = 0xE000000000000000;
    sub_2494AE010();
    swift_bridgeObjectRelease();
    v72 = 0xD000000000000011;
    v73 = 0x80000002494B72C0;
    sub_2494ADFEC();
    v24 = v72;
    v25 = v73;
    *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v23 + 32) = v24;
    *(_QWORD *)(v23 + 40) = v25;
    sub_2494AE04C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v64);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v60 = 0;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v61, v7, v22);
  sub_2494ADF08();
  v26 = sub_2494ADF14();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v21, 0, 1, v26);
  v27 = v70;
  sub_2494ADF38();
  sub_2494ADC94(v21, &qword_257866B10);
  v28 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v72 = MEMORY[0x24BEE4AF8];
  sub_2494ADCD0();
  sub_2494ADF74();
  v29 = *(_QWORD *)(v72 + 16);
  v65 = (char *)v72;
  if (!v29)
  {
    v71 = v28;
    v56 = v68;
    v55 = v69;
LABEL_26:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v27, v56);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v61, v67);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v64);
    return v71;
  }
  v30 = (uint64_t *)(v72 + 72);
  v71 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v31 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    v33 = *(v30 - 5);
    v32 = *(v30 - 4);
    v35 = *(v30 - 3);
    v34 = *(v30 - 2);
    v37 = *(v30 - 1);
    v36 = *v30;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v74 = v31;
    v40 = sub_2494ACFD4(v33, v32);
    v41 = v31[2];
    v42 = (v39 & 1) == 0;
    v43 = v41 + v42;
    if (__OFADD__(v41, v42))
      break;
    v44 = v39;
    if (v31[3] >= v43)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v47 = v74;
        if ((v39 & 1) != 0)
          goto LABEL_14;
      }
      else
      {
        sub_2494AD42C();
        v47 = v74;
        if ((v44 & 1) != 0)
          goto LABEL_14;
      }
    }
    else
    {
      sub_2494AD038(v43, isUniquelyReferenced_nonNull_native);
      v45 = sub_2494ACFD4(v33, v32);
      if ((v44 & 1) != (v46 & 1))
        goto LABEL_29;
      v40 = v45;
      v47 = v74;
      if ((v44 & 1) != 0)
      {
LABEL_14:
        v48 = (_QWORD *)(v47[7] + 32 * v40);
        *v48 = v35;
        v48[1] = v34;
        v48[2] = v37;
        v48[3] = v36;
        goto LABEL_18;
      }
    }
    v47[(v40 >> 6) + 8] |= 1 << v40;
    v49 = (uint64_t *)(v47[6] + 16 * v40);
    *v49 = v33;
    v49[1] = v32;
    v50 = (_QWORD *)(v47[7] + 32 * v40);
    *v50 = v35;
    v50[1] = v34;
    v50[2] = v37;
    v50[3] = v36;
    v51 = v47[2];
    v52 = __OFADD__(v51, 1);
    v53 = v51 + 1;
    if (v52)
      goto LABEL_28;
    v47[2] = v53;
    swift_bridgeObjectRetain();
LABEL_18:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v54 = swift_isUniquelyReferenced_nonNull_native();
    v55 = v69;
    v27 = v70;
    if ((v54 & 1) != 0)
    {
      v56 = v68;
      v57 = v71;
    }
    else
    {
      v57 = sub_2494ACD7C(0, v71[2] + 1, 1, v71);
      v56 = v68;
    }
    v59 = v57[2];
    v58 = v57[3];
    if (v59 >= v58 >> 1)
      v57 = sub_2494ACD7C((_QWORD *)(v58 > 1), v59 + 1, 1, v57);
    v57[2] = v59 + 1;
    v71 = v57;
    v57[v59 + 4] = v47;
    v30 += 6;
    if (!--v29)
      goto LABEL_26;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  result = (_QWORD *)sub_2494AE040();
  __break(1u);
  return result;
}

unint64_t type metadata accessor for TypistMathSupport()
{
  unint64_t result;

  result = qword_257866DD0;
  if (!qword_257866DD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257866DD0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495B16F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2494ADC94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2494ADCD0()
{
  unint64_t result;

  result = qword_257866DD8[0];
  if (!qword_257866DD8[0])
  {
    result = MEMORY[0x2495B16FC](&unk_2494B1E28, &_s9CollectorVN);
    atomic_store(result, qword_257866DD8);
  }
  return result;
}

ValueMetadata *_s9CollectorVMa()
{
  return &_s9CollectorVN;
}

uint64_t sub_2494ADD28(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2494ADD68(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2494ADD88(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_2494ADE44(a1, &qword_257866B38);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2494ADDD4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2494ADDF4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_2494ADE44(a1, &qword_257866B50);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_2494ADE44(a1, &qword_257866B58);
}

void sub_2494ADE44(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void __getITTKeyboardProxyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getITTKeyboardConfigurationClass_block_invoke_cold_1(v0);
}

void __getITTKeyboardConfigurationClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_2494ADED8();
}

uint64_t sub_2494ADED8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2494ADEE4()
{
  return MEMORY[0x24BE64088]();
}

uint64_t sub_2494ADEF0()
{
  return MEMORY[0x24BE640A0]();
}

uint64_t sub_2494ADEFC()
{
  return MEMORY[0x24BE640B0]();
}

uint64_t sub_2494ADF08()
{
  return MEMORY[0x24BE640C0]();
}

uint64_t sub_2494ADF14()
{
  return MEMORY[0x24BE640D0]();
}

uint64_t sub_2494ADF20()
{
  return MEMORY[0x24BE64100]();
}

uint64_t sub_2494ADF2C()
{
  return MEMORY[0x24BE64108]();
}

uint64_t sub_2494ADF38()
{
  return MEMORY[0x24BE64120]();
}

uint64_t sub_2494ADF44()
{
  return MEMORY[0x24BE64128]();
}

uint64_t sub_2494ADF50()
{
  return MEMORY[0x24BE64150]();
}

uint64_t sub_2494ADF5C()
{
  return MEMORY[0x24BE64168]();
}

uint64_t sub_2494ADF68()
{
  return MEMORY[0x24BE64180]();
}

uint64_t sub_2494ADF74()
{
  return MEMORY[0x24BE641A0]();
}

uint64_t sub_2494ADF80()
{
  return MEMORY[0x24BE641B0]();
}

uint64_t sub_2494ADF8C()
{
  return MEMORY[0x24BE641C0]();
}

uint64_t sub_2494ADF98()
{
  return MEMORY[0x24BE641C8]();
}

uint64_t sub_2494ADFA4()
{
  return MEMORY[0x24BE641D0]();
}

uint64_t sub_2494ADFB0()
{
  return MEMORY[0x24BE641D8]();
}

uint64_t sub_2494ADFBC()
{
  return MEMORY[0x24BE641E0]();
}

uint64_t sub_2494ADFC8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2494ADFD4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2494ADFE0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2494ADFEC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2494ADFF8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2494AE004()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2494AE010()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2494AE01C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2494AE028()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2494AE034()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2494AE040()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2494AE04C()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_2494AE058()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2494AE064()
{
  return MEMORY[0x24BEE4328]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t GSEventSetHardwareKeyboardAttached()
{
  return MEMORY[0x24BE3D5B0]();
}

uint64_t GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType()
{
  return MEMORY[0x24BE3D5B8]();
}

uint64_t GSInitialize()
{
  return MEMORY[0x24BE3D5C8]();
}

uint64_t GSKeyboardCreate()
{
  return MEMORY[0x24BE3D5D0]();
}

uint64_t GSKeyboardGetModifierState()
{
  return MEMORY[0x24BE3D5D8]();
}

uint64_t GSKeyboardHWKeyboardNormalizeInput()
{
  return MEMORY[0x24BE3D5E0]();
}

uint64_t GSKeyboardRelease()
{
  return MEMORY[0x24BE3D5E8]();
}

uint64_t GSKeyboardTranslateKeyExtended()
{
  return MEMORY[0x24BE3D5F0]();
}

uint64_t GSMainScreenPixelSize()
{
  return MEMORY[0x24BE3D600]();
}

uint64_t GSMainScreenPointSize()
{
  return MEMORY[0x24BE3D608]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x24BE3D630]();
}

uint64_t IOHIDUserDeviceCreate()
{
  return MEMORY[0x24BDD85B0]();
}

uint64_t IOHIDUserDeviceHandleReport()
{
  return MEMORY[0x24BDD85C0]();
}

uint64_t IOHIDUserDeviceScheduleWithRunLoop()
{
  return MEMORY[0x24BDD85F8]();
}

uint64_t IOHIDUserDeviceUnscheduleFromRunLoop()
{
  return MEMORY[0x24BDD8618]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLogv(NSString *format, va_list args)
{
  MEMORY[0x24BDD1008](format, args);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t SBSAlertItemsSuppressionAssertionCreate()
{
  return MEMORY[0x24BEB0BC8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIKeyboardCurrencyVariants()
{
  return MEMORY[0x24BDF79E0]();
}

uint64_t UIKeyboardGetCurrentIdiom()
{
  return MEMORY[0x24BDF7A30]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x24BDF7A38]();
}

uint64_t UIKeyboardGetCurrentUILanguage()
{
  return MEMORY[0x24BDF7A40]();
}

uint64_t UIKeyboardGetSupportedHardwareKeyboardsForInputMode()
{
  return MEMORY[0x24BDF7A58]();
}

uint64_t UIKeyboardGetSupportedInputModes()
{
  return MEMORY[0x24BDF7A60]();
}

uint64_t UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom()
{
  return MEMORY[0x24BDF7A70]();
}

uint64_t UIKeyboardInputModeWithNewHWLayout()
{
  return MEMORY[0x24BDF7AC0]();
}

uint64_t UIKeyboardInputModeWithNewSWLayout()
{
  return MEMORY[0x24BDF7AC8]();
}

uint64_t UIKeyboardRomanAccentVariants()
{
  return MEMORY[0x24BDF7B30]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

double drand48(void)
{
  double result;

  MEMORY[0x24BDAE0B0]();
  return result;
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pclose(FILE *a1)
{
  return MEMORY[0x24BDAF5A0](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAF5E0](a1, a2);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x24BDAF600](a1, a2, a3, a4, __argv, __envp);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x24BEDE1B8](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

void srand48(uint64_t a1)
{
  MEMORY[0x24BDAFE88](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

