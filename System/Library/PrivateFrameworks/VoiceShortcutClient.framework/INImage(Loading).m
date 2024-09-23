@implementation INImage(Loading)

- (void)retrieveImageDataWithCompletion:()Loading
{
  void (**v4)(id, void *, _QWORD);
  _QWORD v5[4];
  void (**v6)(id, void *, _QWORD);

  v4 = a3;
  if (objc_msgSend(a1, "_isSystem"))
  {
    v4[2](v4, a1, 0);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__INImage_Loading__retrieveImageDataWithCompletion___block_invoke;
    v5[3] = &unk_1E5FC82B8;
    v6 = v4;
    objc_msgSend(a1, "_retrieveImageDataWithReply:", v5);

  }
}

@end
