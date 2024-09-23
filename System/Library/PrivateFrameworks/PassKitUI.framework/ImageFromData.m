@implementation ImageFromData

void __ImageFromData_block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  id v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "scale");
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0DC3870]);
  if (a2)
    v7 = a2;
  else
    v7 = *(_QWORD *)(a1 + 48);
  v8 = (id)objc_msgSend(v6, "initWithCGImage:scale:orientation:", v7, 0, v5);
  CFRelease(*(CFTypeRef *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
