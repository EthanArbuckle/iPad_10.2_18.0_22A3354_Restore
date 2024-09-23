@implementation VGMLHRTFEncoderModel

- (void)inferCaptureData:(const void *)a3 toOutput:(id)a4
{
  CVPixelBufferRef CVPixelBufferFromIOSurface;
  uint64_t v7;
  void *v8;
  CVPixelBufferRef v9;
  void *v10;
  CVPixelBufferRef v11;
  void *v12;
  IOSurface *v13;
  CVPixelBufferRef v14;
  void *v15;
  IOSurface *v16;
  CVPixelBufferRef v17;
  void *v18;
  IOSurface *v19;
  CVPixelBufferRef v20;
  void (**v21)(_QWORD);
  void *v22;
  IOSurface *v23;
  CVPixelBufferRef v24;
  void (**v25)(_QWORD);
  void *v26;
  IOSurface *v27;
  CVPixelBufferRef v28;
  void (**v29)(_QWORD);
  void *v30;
  IOSurface *v31;
  CVPixelBufferRef v32;
  void (**v33)(_QWORD);
  void *v34;
  void *v35;
  void (**v36)(_QWORD);
  void (**v37)(_QWORD);
  void (**v38)(_QWORD);
  void (**v39)(_QWORD);
  void (**v40)(_QWORD);
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[6];

  v41 = a4;
  CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(**(IOSurface ***)a3);
  v7 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke;
  v50[3] = &__block_descriptor_40_e5_v8__0l;
  v50[4] = CVPixelBufferFromIOSurface;
  v40 = (void (**)(_QWORD))MEMORY[0x24BD03294](v50);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindImage:", CVPixelBufferFromIOSurface);

  v9 = createCVPixelBufferFromIOSurface(*(IOSurface **)(*(_QWORD *)a3 + 80));
  v49[0] = v7;
  v49[1] = 3221225472;
  v49[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_2;
  v49[3] = &__block_descriptor_40_e5_v8__0l;
  v49[4] = v9;
  v39 = (void (**)(_QWORD))MEMORY[0x24BD03294](v49);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bindImage:", v9);

  v11 = createCVPixelBufferFromIOSurface(*(IOSurface **)(*(_QWORD *)a3 + 160));
  v48[0] = v7;
  v48[1] = 3221225472;
  v48[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_3;
  v48[3] = &__block_descriptor_40_e5_v8__0l;
  v48[4] = v11;
  v38 = (void (**)(_QWORD))MEMORY[0x24BD03294](v48);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bindImage:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)a3 + 8), "vg_toFloat16Surface");
  v13 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  v14 = createCVPixelBufferFromIOSurface(v13);

  v47[0] = v7;
  v47[1] = 3221225472;
  v47[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_4;
  v47[3] = &__block_descriptor_40_e5_v8__0l;
  v47[4] = v14;
  v37 = (void (**)(_QWORD))MEMORY[0x24BD03294](v47);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bindImage:", v14);

  objc_msgSend(*(id *)(*(_QWORD *)a3 + 88), "vg_toFloat16Surface");
  v16 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  v17 = createCVPixelBufferFromIOSurface(v16);

  v46[0] = v7;
  v46[1] = 3221225472;
  v46[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_5;
  v46[3] = &__block_descriptor_40_e5_v8__0l;
  v46[4] = v17;
  v36 = (void (**)(_QWORD))MEMORY[0x24BD03294](v46);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bindImage:", v17);

  objc_msgSend(*(id *)(*(_QWORD *)a3 + 168), "vg_toFloat16Surface");
  v19 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  v20 = createCVPixelBufferFromIOSurface(v19);

  v45[0] = v7;
  v45[1] = 3221225472;
  v45[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_6;
  v45[3] = &__block_descriptor_40_e5_v8__0l;
  v45[4] = v20;
  v21 = (void (**)(_QWORD))MEMORY[0x24BD03294](v45);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bindImage:", v20);

  objc_msgSend(*(id *)(*(_QWORD *)a3 + 16), "vg_toFloat16Surface");
  v23 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  v24 = createCVPixelBufferFromIOSurface(v23);

  v44[0] = v7;
  v44[1] = 3221225472;
  v44[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_7;
  v44[3] = &__block_descriptor_40_e5_v8__0l;
  v44[4] = v24;
  v25 = (void (**)(_QWORD))MEMORY[0x24BD03294](v44);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bindImage:", v24);

  objc_msgSend(*(id *)(*(_QWORD *)a3 + 96), "vg_toFloat16Surface");
  v27 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  v28 = createCVPixelBufferFromIOSurface(v27);

  v43[0] = v7;
  v43[1] = 3221225472;
  v43[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_8;
  v43[3] = &__block_descriptor_40_e5_v8__0l;
  v43[4] = v28;
  v29 = (void (**)(_QWORD))MEMORY[0x24BD03294](v43);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bindImage:", v28);

  objc_msgSend(*(id *)(*(_QWORD *)a3 + 176), "vg_toFloat16Surface");
  v31 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  v32 = createCVPixelBufferFromIOSurface(v31);

  v42[0] = v7;
  v42[1] = 3221225472;
  v42[2] = __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_9;
  v42[3] = &__block_descriptor_40_e5_v8__0l;
  v42[4] = v32;
  v33 = (void (**)(_QWORD))MEMORY[0x24BD03294](v42);
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bindImage:", v32);

  -[NSMutableArray objectAtIndexedSubscript:](self->super._outputBuffers, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bindTensor:", v41);

  -[VGMLEspressoModel inferModel](self, "inferModel");
  v33[2](v33);

  v29[2](v29);
  v25[2](v25);

  v21[2](v21);
  v36[2](v36);

  v37[2](v37);
  v38[2](v38);

  v39[2](v39);
  v40[2](v40);

}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_2(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_3(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_4(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_5(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_6(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_7(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_8(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

void __50__VGMLHRTFEncoderModel_inferCaptureData_toOutput___block_invoke_9(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
}

@end
