@implementation NSValueTransformer(MTLInversionAdditions)

- (id)mtl_invertedTransformer
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  if ((objc_msgSend((id)objc_opt_class(), "allowsReverseTransformation") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLInversionAdditions.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.class.allowsReverseTransformation"));

  }
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EF727668))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSValueTransformer+MTLInversionAdditions.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self respondsToSelector:@selector(reverseTransformedValue:success:error:)]"));

    }
    v4 = a1;
    v5 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke;
    v15[3] = &unk_1E7AF2B38;
    v16 = v4;
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_2;
    v13[3] = &unk_1E7AF2B38;
    v14 = v16;
    v6 = v16;
    +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", v15, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11[4] = a1;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_3;
    v12[3] = &unk_1E7AF2B38;
    v12[4] = a1;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__NSValueTransformer_MTLInversionAdditions__mtl_invertedTransformer__block_invoke_4;
    v11[3] = &unk_1E7AF2B38;
    +[MTLValueTransformer transformerUsingForwardBlock:reverseBlock:](MTLValueTransformer, "transformerUsingForwardBlock:reverseBlock:", v12, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
