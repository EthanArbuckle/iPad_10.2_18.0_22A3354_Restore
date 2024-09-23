@implementation RBLayer

- (id)actionForKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "characterAtIndex:", 0) == 99
    && ((objc_msgSend(a3, "isEqualToString:", CFSTR("contents")) & 1) != 0
     || (objc_msgSend(a3, "isEqualToString:", CFSTR("contentsRect")) & 1) != 0
     || (objc_msgSend(a3, "isEqualToString:", CFSTR("contentsTransform")) & 1) != 0))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)RBLayer;
  return -[RBLayer actionForKey:](&v6, sel_actionForKey_, a3);
}

+ (id)defaultValueForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("opaque")) & 1) != 0)
    return (id)MEMORY[0x24BDBD1C8];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("needsLayoutOnGeometryChange")) & 1) != 0)
    return (id)MEMORY[0x24BDBD1C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RBLayer;
  return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
}

- (void)setRendersAsynchronously:(BOOL)a3
{
  *((_BYTE *)self + 174) = a3;
}

- (void)setAllowsPackedDrawable:(BOOL)a3
{
  *((_BYTE *)self + 178) = a3;
}

- (BOOL)displayWithBounds:(CGRect)a3 callback:(id)a4
{
  double y;
  double x;
  double v8;
  BOOL v9;
  RBDevice *v11;
  float64x2_t v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;
  int v16;
  int RotationFlags;
  int v18;
  double v19;
  double v20;
  double v21;
  double d;
  double ty;
  double tx;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  int32x2_t v28;
  CGFloat a;
  uint64_t v30;
  void *v31;
  int32x2_t v32;
  uint32x2_t v33;
  int8x8_t v34;
  int8x8_t v35;
  int8x8_t v36;
  uint64_t v37;
  int v38;
  _BOOL4 v39;
  char v40;
  char v41;
  _BOOL4 v42;
  _BOOL4 v43;
  int v44;
  __int32 v45;
  __int32 v46;
  __int32 v52;
  float32x4_t v53;
  int32x2_t v54;
  int8x16_t v55;
  unsigned int v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t valid;
  const float *v60;
  int32x2_t v61;
  uint32x2_t v62;
  NSObject *v63;
  MTLPixelFormat v64;
  char *v65;
  RB::Device *v66;
  RB::SharedSurfaceGroup *v67;
  uint64_t v68;
  unsigned __int32 v69;
  uint64_t v70;
  unsigned int *v71;
  unsigned int *v72;
  unsigned int v73;
  unsigned int v74;
  RB::Device *v75;
  os_unfair_lock_s *v76;
  float v77;
  uint64_t v78;
  id v79;
  void *v80;
  double v81;
  id *v82;
  RB::Drawable *v83;
  unsigned int *v84;
  unsigned int v85;
  unsigned int *v86;
  unsigned int v87;
  RB::Drawable *v88;
  unsigned int *v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int *v92;
  unsigned int v93;
  unsigned int v94;
  RBLayer *v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int32x2_t v100;
  __n128 v101;
  double v102;
  double v103;
  CGFloat width;
  double height;
  _QWORD block[4];
  __n128 v107;
  RBLayer *v108;
  double v109;
  id v110;
  id v111;
  unint64_t v112;
  id v113;
  RB::Drawable *v114;
  double v115;
  id v116;
  double v117;
  int v118;
  int v119;
  int v120;
  int v121;
  char v122;
  char v123;
  char v124;
  char v125;
  char v126;
  void (*v127[4])(_QWORD, _QWORD);
  id v128;
  double v129;
  double v130;
  CGFloat v131;
  double v132;
  double v133;
  int v134;
  char v135;
  int v136;
  __int16 v137;
  CGFloat v138;
  __int128 v139;
  double v140;
  double v141;
  double v142;
  unsigned __int8 v143[4];
  int v144;
  CGAffineTransform t2;
  CGAffineTransform t1;
  __int128 v147;
  CGAffineTransform v148;
  uint64_t v149;

  width = a3.size.width;
  height = a3.size.height;
  v149 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)self + 169))
  {
    y = a3.origin.y;
    x = a3.origin.x;
    if (!+[RBDevice isRunningInBackground](RBDevice, "isRunningInBackground"))
    {
      -[RBLayer contentsScale](self, "contentsScale");
      if (v8 != 0.0)
      {
        v103 = v8;
        os_unfair_lock_lock((os_unfair_lock_t)self + 8);
        v11 = current_device_locked(self);
        if (v11)
        {

          v11 = v11;
          os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
          if (v11)
          {
            v12.f64[0] = width;
            v12.f64[1] = height;
            v100 = vmovn_s64(vcvtq_s64_f64(vrndpq_f64(vmulq_n_f64(v12, v103))));
            *(int32x2_t *)&v12.f64[0] = vcgt_s32((int32x2_t)0x100000001, v100);
            if ((vpmax_u32(*(uint32x2_t *)&v12.f64[0], *(uint32x2_t *)&v12.f64[0]).u32[0] & 0x80000000) == 0)
            {
              v13 = -[RBLayer allowsDisplayCompositing](self, "allowsDisplayCompositing");
              if (-[RBLayer rendersAsynchronously](self, "rendersAsynchronously"))
                v14 = !-[RBLayer needsSynchronousUpdate](self, "needsSynchronousUpdate");
              else
                v14 = 0;
              *((_BYTE *)self + 175) = 0;
              if (-[RBLayer allowsPackedDrawable](self, "allowsPackedDrawable") && !*((_QWORD *)self + 18))
              {
                v66 = (RB::Device *)-[RBDecodedFontMetadata fontUID]((uint64_t)v11);
                v67 = (RB::SharedSurfaceGroup *)RB::Device::shared_surfaces(v66);
                v15 = RB::SharedSurfaceGroup::preflight_subsurface(v67, vadd_s32((int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(vdup_lane_s32(v100, 1), v100), 0), (int8x8_t)vrev64_s32(v100), (int8x8_t)v100), (int32x2_t)0x200000002));
              }
              else
              {
                v15 = 0;
              }
              v16 = -[RBLayer isOpaque](self, "isOpaque");
              if (v15)
              {
                if ((vcgt_s32(vdup_lane_s32(v100, 1), v100).u8[0] & 1) != 0)
                  RotationFlags = 4;
                else
                  RotationFlags = 0;
              }
              else
              {
                if (*((_QWORD *)self + 7))
                  v18 = v13;
                else
                  v18 = 0;
                if (v18 == 1)
                {
                  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
                  RotationFlags = CAImageQueueGetRotationFlags();
                  os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
                }
                else
                {
                  RotationFlags = 0;
                }
              }
              if (-[RBLayer allowsBottomLeftOrigin](self, "allowsBottomLeftOrigin")
                && !-[RBLayer contentsAreFlipped](self, "contentsAreFlipped"))
              {
                v21 = v103;
                d = -v103;
                v19 = -x;
                v20 = y + height;
              }
              else
              {
                v19 = -x;
                v20 = -y;
                v21 = v103;
                d = v103;
              }
              v147 = 0uLL;
              ty = v21 * v20;
              tx = v19 * v21;
              if (RotationFlags)
              {
                if ((-[RBLayer displayWithBounds:callback:]::inverses[RotationFlags & 7] & 4) != 0)
                {
                  v27 = vmulq_n_f64((float64x2_t)xmmword_209BD5290, (double)v100.i32[1]);
                  v25 = (float64x2_t)xmmword_209BD7760;
                  v26 = (float64x2_t)xmmword_209BD52A0;
                  v28 = vrev64_s32(v100);
                }
                else
                {
                  v25 = (float64x2_t)xmmword_209BD52A0;
                  v26 = (float64x2_t)xmmword_209BD5290;
                  v27 = 0uLL;
                  v28 = v100;
                }
                v102 = *(double *)&v28;
                if ((-[RBLayer displayWithBounds:callback:]::inverses[RotationFlags & 7] & 2) != 0)
                {
                  v27 = vmlaq_f64(vmlaq_n_f64(v27, v26, (double)v100.i32[0]), (float64x2_t)0, v25);
                  v26 = vnegq_f64(v26);
                }
                if ((-[RBLayer displayWithBounds:callback:]::inverses[RotationFlags & 7] & 1) != 0)
                {
                  v27 = vmlaq_f64(vmlaq_n_f64(v27, v25, (double)v100.i32[1]), (float64x2_t)0, v26);
                  v25 = vnegq_f64(v25);
                }
                *(_OWORD *)&t1.b = v147;
                t1.a = v103;
                t1.d = d;
                t1.tx = tx;
                t1.ty = ty;
                *(float64x2_t *)&t2.a = v26;
                *(float64x2_t *)&t2.c = v25;
                *(float64x2_t *)&t2.tx = v27;
                CGAffineTransformConcat(&v148, &t1, &t2);
                v147 = *(_OWORD *)&v148.b;
                a = v148.a;
                d = v148.d;
                tx = v148.tx;
                ty = v148.ty;
              }
              else
              {
                a = v21;
                v102 = *(double *)&v100;
              }
              v30 = -[RBLayer colorMode](self, "colorMode");
              v98 = RotationFlags;
              v97 = v30;
              RB::ColorMode::ColorMode(v143, v30);
              v31 = (void *)objc_opt_new();
              objc_msgSend(v31, "setProfile:", 2);
              objc_msgSend(v31, "setDefaultColorSpace:", rb_color_space(((v144 & 1) == 0) | 0x100u));
              v32.i32[0] = 0;
              v33 = (uint32x2_t)vceq_s32(*(int32x2_t *)&v102, (int32x2_t)0x8000000080000000);
              v34 = (int8x8_t)vdup_lane_s32(vcgt_s32(v32, (int32x2_t)vpmin_u32(v33, v33)), 0);
              v35 = vbsl_s8(v34, (int8x8_t)vdup_n_s32(0x7F7FFFFFu), (int8x8_t)vcvt_f32_s32(*(int32x2_t *)&v102));
              v36 = vand_s8((int8x8_t)0x100000001000000, v34);
              objc_msgSend(v31, "setContentRect:", *(float *)v36.i32, *(float *)&v36.i32[1], *(float *)v35.i32, *(float *)&v35.i32[1]);
              v139 = v147;
              v138 = a;
              v140 = d;
              v141 = tx;
              v142 = ty;
              objc_msgSend(v31, "concat:", &v138);
              (*((void (**)(id, void *))a4 + 2))(a4, v31);
              v37 = objc_msgSend(v31, "_rb_contents");
              if (v37)
              {
                v38 = RB::DisplayList::Layer::output_depth((RB::DisplayList::Layer *)(v37 + 320));
                v143[0] = RB::max_color_depth(v143[0], v38);
              }
              v39 = -[RBLayer promotesFramebuffer](self, "promotesFramebuffer");
              v99 = v16;
              if (v16)
                v40 = 2;
              else
                v40 = 3;
              if ((_DWORD)v13)
                v40 |= 4u;
              if (v39)
                v41 = v40;
              else
                v41 = v40 | 0x20;
              v42 = -[RBLayer clearsBackground](self, "clearsBackground");
              v43 = v42;
              if (v42)
                v44 = 2;
              else
                v44 = 1;
              v96 = v44;
              v101 = 0u;
              if (v42)
              {
                -[RBLayer clearColor](self, "clearColor");
                __asm { FMOV            V4.4S, #1.0 }
                v53.i32[3] = _Q4.i32[3];
                v53.i32[0] = v52;
                v55 = (int8x16_t)vdupq_lane_s32(v54, 0);
                if (v99)
                  v56 = -1;
                else
                  v56 = 0;
                v53.i32[1] = v45;
                v53.i32[2] = v46;
                v101 = (__n128)vmulq_f32(v53, (float32x4_t)vbslq_s8((int8x16_t)vdupq_n_s32(v56), _Q4, v55));
              }
              v57 = -[RBLayer pixelFormat](self, "pixelFormat");
              v137 = 0;
              v136 = 0;
              if (v57)
              {
                HIBYTE(v137) = RB::ColorMode::output_space((RB::ColorMode *)v143);
                LOBYTE(v137) = (v144 & 1) == 0;
              }
              else
              {
                v58 = -[RBDecodedFontMetadata fontUID]((uint64_t)v11);
                v57 = RB::ColorMode::pixel_format(v143, v58, v41, (_BYTE *)&v137 + 1, (BOOL *)&v137, &v136);
              }
              valid = -[RBDecodedFontMetadata fontUID]((uint64_t)v11);
              if ((v57 & 0x80000000) != 0)
              {
                valid = RB::Device::valid_texture_size_nonnative(valid, v57, *(int32x2_t *)&v102);
                if ((valid & 1) == 0)
                  goto LABEL_64;
              }
              else
              {
                v60 = (const float *)(valid + 288);
                v61 = (int32x2_t)vld1_dup_f32(v60);
                v62 = (uint32x2_t)vand_s8((int8x8_t)vcge_s32(v61, *(int32x2_t *)&v102), (int8x8_t)vcgtz_s32(*(int32x2_t *)&v102));
                if ((vpmin_u32(v62, v62).u32[0] & 0x80000000) == 0)
                {
LABEL_64:
                  v63 = RB::error_log((RB *)valid);
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
                  {
                    v65 = RB::pixel_format_name((RB *)v57, v64);
                    -[RBLayer displayWithBounds:callback:].cold.4((uint64_t)v65, (uint64_t)&v148, v63, v102);
                  }
                  v9 = 0;
LABEL_116:

                  goto LABEL_117;
                }
              }
              *(_QWORD *)&v148.a = (char *)self + 32;
              LOBYTE(v148.b) = 1;
              os_unfair_lock_lock((os_unfair_lock_t)self + 8);
              v68 = MEMORY[0x24BDAC760];
              if (v15)
              {
                if (v43)
                  v69 = 7;
                else
                  v69 = 3;
                if (v14 && *((_QWORD *)self + 10))
                  v69 |= 8u;
                v127[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x24BDAC760];
                v127[1] = (void (*)(_QWORD, _QWORD))3321888768;
                v127[2] = (void (*)(_QWORD, _QWORD))__38__RBLayer_displayWithBounds_callback___block_invoke;
                v127[3] = (void (*)(_QWORD, _QWORD))&__block_descriptor_85_e8_32c29_ZTSN2RB8objc_ptrIP7RBLayerEE_e9_v16__0_v8l;
                v95 = self;
                v128 = v95;
                v134 = v98;
                v129 = x;
                v130 = y;
                v131 = width;
                v132 = height;
                v133 = v103;
                v135 = (v69 & 8) >> 3;
                if (!*((_QWORD *)self + 17))
                {
                  v70 = operator new();
                  *(_DWORD *)(v70 + 8) = 1;
                  *(_QWORD *)v70 = off_24C228E08;
                  *(_QWORD *)(v70 + 24) = 0;
                  *(_DWORD *)(v70 + 32) = 0;
                  *(_QWORD *)(v70 + 16) = self;
                  v71 = (unsigned int *)*((_QWORD *)self + 17);
                  *((_QWORD *)self + 17) = v70;
                  if (v71)
                  {
                    v72 = v71 + 2;
                    do
                    {
                      v73 = __ldxr(v72);
                      v74 = v73 - 1;
                    }
                    while (__stlxr(v74, v72));
                    if (!v74)
                    {
                      __dmb(9u);
                      (*(void (**)(unsigned int *))(*(_QWORD *)v71 + 8))(v71);
                    }
                  }
                }
                v75 = (RB::Device *)-[RBDecodedFontMetadata fontUID]((uint64_t)v11);
                v76 = (os_unfair_lock_s *)RB::Device::shared_surfaces(v75);
                v77 = v103;
                v78 = RB::SharedSurfaceGroup::add_subsurface(v76, *((RB::SharedSurfaceClient **)self + 17), v57, HIBYTE(v137), v136, v31, v69, v127, COERCE_DOUBLE(vadd_s32(*(int32x2_t *)&v102, (int32x2_t)0x200000002)), v77, v101);
                if (v78)
                {
                  if ((v69 & 8) != 0)
                    *((_QWORD *)self + 9) = v78;
                  -[RBLayer updateColor](self);
                  std::unique_lock<RB::spin_lock>::unlock((uint64_t)&v148);
                  RBXMLRecorderMarkFrame(self, v31, HIBYTE(v137), (double)SLODWORD(v102), (double)SHIDWORD(v102));
                  v79 = v128;
LABEL_113:

                  if (LOBYTE(v148.b))
                    os_unfair_lock_unlock(*(os_unfair_lock_t *)&v148.a);
                  v9 = 1;
                  goto LABEL_116;
                }

              }
              -[RBLayer _clearSubsurface]((uint64_t)self);
              ensure_drawable_locked(self);
              v80 = (void *)*((_QWORD *)self + 7);
              if (v80)
              {
                objc_msgSend(v80, "contentsScale");
                if (v81 != v103)
                {
                  objc_msgSend(*((id *)self + 7), "setContentsScale:", v103);
                  v14 = 0;
                }
              }
              else
              {
                v82 = -[RBImageQueueLayer initWithSlots:]([RBImageQueueLayer alloc]);

                *((_QWORD *)self + 7) = v82;
                objc_msgSend(v82, "setContentsScale:", v103);
                -[RBLayer insertSublayer:atIndex:](self, "insertSublayer:atIndex:", *((_QWORD *)self + 7), 0);
                v14 = 0;
              }
              objc_msgSend(*((id *)self + 7), "setPosition:", x, y, v95);
              objc_msgSend(*((id *)self + 7), "setAllowsDisplayCompositing:", v13);
              if ((v13 & 1) == 0 && -[RBLayer contentsAreFlipped](self, "contentsAreFlipped"))
                v136 |= 0x80u;
              v95 = self;
              v79 = *((id *)self + 7);
              v83 = (RB::Drawable *)*((_QWORD *)self + 6);
              if (v83)
              {
                v84 = (unsigned int *)((char *)v83 + 8);
                do
                  v85 = __ldxr(v84);
                while (__stxr(v85 + 1, v84));
              }
              -[RBLayer updateColor](self);
              std::unique_lock<RB::spin_lock>::unlock((uint64_t)&v148);
              block[0] = v68;
              block[1] = 3321888768;
              block[2] = __38__RBLayer_displayWithBounds_callback___block_invoke_27;
              block[3] = &unk_24C222DF8;
              v109 = v102;
              v122 = v13 ^ 1;
              v110 = v79;
              v111 = v11;
              v112 = v57;
              v123 = HIBYTE(v137);
              v118 = v136;
              v113 = v95;
              if (v83)
              {
                v86 = (unsigned int *)((char *)v83 + 8);
                do
                  v87 = __ldxr(v86);
                while (__stxr(v87 + 1, v86));
              }
              v114 = v83;
              v115 = v103;
              v124 = v137;
              v119 = v97;
              v125 = v99;
              v107 = v101;
              v126 = v14;
              v120 = v96;
              v121 = v98;
              v116 = v31;
              v108 = self;
              v117 = v102;
              RB::Drawable::begin_frame(v83);
              if (v14)
                dispatch_async((dispatch_queue_t)-[RBDevice queue](v11, "queue"), block);
              else
                dispatch_sync((dispatch_queue_t)-[RBDevice queue](v11, "queue"), block);

              v88 = v114;
              if (v114)
              {
                v89 = (unsigned int *)((char *)v114 + 8);
                do
                {
                  v90 = __ldxr(v89);
                  v91 = v90 - 1;
                }
                while (__stlxr(v91, v89));
                if (!v91)
                {
                  __dmb(9u);
                  (*(void (**)(RB::Drawable *))(*(_QWORD *)v88 + 8))(v88);
                }
              }

              if (v83)
              {
                v92 = (unsigned int *)((char *)v83 + 8);
                do
                {
                  v93 = __ldxr(v92);
                  v94 = v93 - 1;
                }
                while (__stlxr(v94, v92));
                if (!v94)
                {
                  __dmb(9u);
                  (*(void (**)(RB::Drawable *))(*(_QWORD *)v83 + 8))(v83);
                }
              }
              goto LABEL_113;
            }
          }
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
        }
        v9 = 0;
LABEL_117:

        return v9;
      }
    }
  }
  return 0;
}

uint64_t __18__RBLayer_display__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInDisplayList:", a2);
}

- (void)updateColor
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  uint64_t *v6;
  const char *v7;
  unsigned int v8;

  if (a1)
  {
    {
      v8 = (unsigned __int16)RB::debug_BOOL((RB *)"RB_COLOR_LAYERS", v7);
      if (v8 <= 0x100)
        LOBYTE(v8) = 0;
      -[RBLayer updateColor]::color_layers = v8 != 0;
    }
    if (-[RBLayer updateColor]::color_layers && pthread_main_np())
    {
      {
        -[RBLayer updateColor]::queue_color = (uint64_t)CGColorCreateSRGB(1.0, 0.0, 0.5, 1.0);
      }
      {
        -[RBLayer updateColor]::shared_color = (uint64_t)CGColorCreateSRGB(0.5, 0.0, 1.0, 1.0);
      }
      {
        -[RBLayer updateColor]::empty_color = (uint64_t)CGColorCreateSRGB(0.0, 1.0, 0.5, 1.0);
      }
      if (a1[7])
      {
        v6 = &-[RBLayer updateColor]::queue_color;
      }
      else
      {
        v6 = &-[RBLayer updateColor]::shared_color;
        if (!a1[9] && !a1[10])
          v6 = &-[RBLayer updateColor]::empty_color;
      }
      objc_msgSend(a1, "setBorderColor:", *v6);
      objc_msgSend(a1, "setBorderWidth:", 1.0);
    }
  }
}

- (BOOL)rendersAsynchronously
{
  return *((_BYTE *)self + 174);
}

- (BOOL)promotesFramebuffer
{
  return *((_BYTE *)self + 176);
}

- (unint64_t)pixelFormat
{
  return *((_QWORD *)self + 23);
}

- (void)drawInDisplayList:(id)a3
{
  void *v5;

  v5 = (void *)-[RBLayer delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "RBLayer:draw:", self, a3);
}

- (void)display
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RBLayer;
  -[RBLayer setContents:](&v4, sel_setContents_, -[RBLayer contents](self, "contents"));
  if (*((_BYTE *)self + 169) && !+[RBDevice isRunningInBackground](RBDevice, "isRunningInBackground"))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __18__RBLayer_display__block_invoke;
    v3[3] = &unk_24C22B3C8;
    v3[4] = self;
    -[RBLayer bounds](self, "bounds");
    -[RBLayer displayWithBounds:callback:](self, "displayWithBounds:callback:", v3);
  }
  else
  {
    *((_BYTE *)self + 170) = 1;
  }
}

- (int)colorMode
{
  return *((_DWORD *)self + 45);
}

- (BOOL)clearsBackground
{
  return *((_BYTE *)self + 177);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)clearColor
{
  float v2;
  float v3;
  float v4;
  float v5;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v2 = *((float *)self + 50);
  v3 = *((float *)self + 51);
  v4 = *((float *)self + 52);
  v5 = *((float *)self + 53);
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)allowsPackedDrawable
{
  return *((_BYTE *)self + 178);
}

- (void)_clearSubsurface
{
  RB::SharedSubsurface *v2;

  if (a1)
  {
    v2 = (RB::SharedSubsurface *)(a1 + 80);
    if (*(_QWORD *)v2)
    {
      RB::SharedSubsurface::reset(v2);
      *(_QWORD *)(a1 + 72) = 0;
      *(_BYTE *)(a1 + 175) = 1;
      objc_msgSend(*(id *)(a1 + 64), "removeFromSuperlayer");

      *(_QWORD *)(a1 + 64) = 0;
    }
  }
}

- (void)setColorMode:(int)a3
{
  *((_DWORD *)self + 45) = a3;
  *((_QWORD *)self + 23) = 0;
}

- (void)setMaxDrawableCount:(int64_t)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 > 2)
    v3 = a3;
  if (v3 >= 3)
    v3 = 3;
  *((_QWORD *)self + 24) = v3;
}

RB::Surface *__38__RBLayer_displayWithBounds_callback___block_invoke_2(uint64_t a1, MTLPixelFormat a2)
{
  RB::Surface *result;
  uint64_t v4;
  uint64_t v5;
  _CAImageQueue *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;

  result = *(RB::Surface **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
    return (RB::Surface *)RB::Surface::texture(result, a2);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 && (v5 = *(_QWORD *)(v4 + 32)) != 0)
    v6 = *(_CAImageQueue **)(v5 + 8);
  else
    v6 = 0;
  v7 = (os_unfair_lock_s *)RB::SurfacePool::shared(0);
  v8 = -[RBDecodedFontMetadata fontUID](*(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = RB::SurfacePool::alloc(v7, v8, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 84), *(_DWORD *)(a1 + 80), v6, *(double *)(a1 + 56), (int8x8_t)vsub_s32(*(int32x2_t *)(a1 + 56), *(int32x2_t *)(a1 + 72)));
  result = *(RB::Surface **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
    return (RB::Surface *)RB::Surface::texture(result, a2);
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  os_unfair_lock_s *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  if (*((_BYTE *)self + 169) && *((_QWORD *)self + 7))
  {
    -[RBLayer bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    os_unfair_lock_unlock(v8);
    if (width != v10 || height != v12)
    {
      -[RBLayer setNeedsSynchronousUpdate:](self, "setNeedsSynchronousUpdate:", 1);
      -[RBLayer setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
  else
  {
    os_unfair_lock_unlock(v8);
  }
  v13.receiver = self;
  v13.super_class = (Class)RBLayer;
  -[RBLayer setBounds:](&v13, sel_setBounds_, x, y, width, height);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 8) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_BYTE *)self + 168) = 0;
  return self;
}

void __38__RBLayer_displayWithBounds_callback___block_invoke(uint64_t a1, int32x2_t *a2)
{
  -[RBLayer setSubsurface:rotated:bounds:contentsScale:locked:](*(_QWORD *)(a1 + 32), a2, *(_DWORD *)(a1 + 80) != 0, a1 + 40, *(_BYTE *)(a1 + 84) == 0, *(double *)(a1 + 72));
}

- (void)setSubsurface:(int)a3 rotated:(uint64_t)a4 bounds:(char)a5 contentsScale:(double)a6 locked:
{
  os_unfair_lock_s *v12;
  uint64_t v13;
  RB::SharedSurfaceGroup *v14;
  int v15;
  __int128 v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  float64x2_t v24;
  _OWORD v25[3];

  if (a1)
  {
    if ((a5 & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v12 = (os_unfair_lock_s *)(a1 + 32);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    }
    *(_QWORD *)(a1 + 72) = 0;
    -[RBLayer _updateSubsurface:](a1, a2);
    v13 = *(_QWORD *)(a1 + 80);
    if (v13)
    {
      v14 = *(RB::SharedSurfaceGroup **)(v13 + 16);
      if (v14)
        RB::SharedSurfaceGroup::schedule_updates(v14);
    }
    v24 = vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_209BD5290, *(double *)a4), (float64x2_t)xmmword_209BD52A0, *(double *)(a4 + 8));
    if (a3)
    {
      v15 = objc_msgSend((id)a1, "contentsAreFlipped");
      v16 = *(_OWORD *)(a4 + 16);
      if (v15)
      {
        v17 = (float64x2_t)xmmword_209BD5290;
        v18 = (float64x2_t)xmmword_209BD52A0;
        v19 = (float64x2_t)vdupq_lane_s64(v16, 0);
        v20 = v24;
      }
      else
      {
        v19 = (float64x2_t)vdupq_lane_s64(v16, 0);
        v20 = vmlaq_n_f64(vmlaq_n_f64(v24, (float64x2_t)xmmword_209BD5290, *(double *)&v16), (float64x2_t)xmmword_209BD52A0, *((double *)&v16 + 1));
        v17 = (float64x2_t)xmmword_209BD7760;
        v18 = (float64x2_t)xmmword_209BD7770;
      }
      v24 = vmlaq_f64(vmlaq_f64(v20, (float64x2_t)0, v18), v17, v19);
      objc_msgSend(*(id *)(a1 + 64), "setContentsScale:", a6, vnegq_f64(v17), *(_OWORD *)&v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "setContentsScale:", a6, 0, 0x3FF0000000000000, 0x3FF0000000000000, 0);
    }
    v21 = *(void **)(a1 + 64);
    v25[0] = v23;
    v25[1] = v22;
    v25[2] = v24;
    objc_msgSend(v21, "setAffineTransform:", v25);
    if ((a5 & 1) == 0)
      os_unfair_lock_unlock(v12);
  }
}

- (uint64_t)_updateSubsurface:(uint64_t)result
{
  int32x2_t *v3;
  void *v4;
  int32x2_t *v5;
  uint64_t v6;
  uint64_t v7;
  int64x2_t v8;
  float64x2_t v9;
  float64x2_t v15;
  int64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;

  if (result)
  {
    v3 = (int32x2_t *)result;
    if (!*(_QWORD *)(result + 80) || a2[6].i32[0] - *(_DWORD *)(result + 128) >= 0)
    {
      v4 = *(void **)(result + 56);
      if (v4)
      {
        objc_msgSend(v4, "removeFromSuperlayer");

        v3[7] = 0;
      }
      if (&v3[10] != a2)
      {
        RB::SharedSubsurface::~SharedSubsurface((id *)&v3[10]);
        *v5 = *a2;
        v5[1] = a2[1];
        v5[2] = a2[2];
        v5[3] = 0;
        v5[6].i32[0] = a2[6].i32[0];
        v5[6].i8[4] = a2[6].i8[4];
        *a2 = 0;
      }
      RB::SharedSurfaceTimestamp::attach((uint64_t)&v3[13], (id)-[int32x2_t context](v3, "context"));
      if (!*(_QWORD *)&v3[8])
      {
        v6 = objc_opt_new();

        v3[8] = (int32x2_t)v6;
        -[int32x2_t addSublayer:](v3, "addSublayer:", *(_QWORD *)&v3[8]);
      }
      if (v3[10])
      {
        v7 = *(_QWORD *)(*(_QWORD *)&v3[10] + 32);
        v8.i64[0] = (int)v7;
        v8.i64[1] = SHIDWORD(v7);
        v9 = vcvtq_f64_s64(v8);
      }
      else
      {
        v9 = 0uLL;
      }
      __asm { FMOV            V1.2D, #1.0 }
      v15 = vdivq_f64(_Q1, v9);
      *(int32x2_t *)&_Q1.f64[0] = vadd_s32(v3[11], (int32x2_t)0x100000001);
      v16.i64[0] = SLODWORD(_Q1.f64[0]);
      v16.i64[1] = SHIDWORD(_Q1.f64[0]);
      v17 = vmulq_f64(v15, vcvtq_f64_s64(v16));
      *(int32x2_t *)&_Q1.f64[0] = vadd_s32(v3[12], (int32x2_t)0x100000001);
      v16.i64[0] = SLODWORD(_Q1.f64[0]);
      v16.i64[1] = SHIDWORD(_Q1.f64[0]);
      v20 = v17;
      if ((-[int32x2_t contentsAreFlipped](v3, "contentsAreFlipped", vmulq_f64(v15, vcvtq_f64_s64(v16))) & 1) == 0)
      {
        v18.f64[0] = v20.f64[0];
        v18.f64[1] = 1.0 - COERCE_DOUBLE(*(_QWORD *)&vaddq_f64(v20, v19).f64[1]);
        v20 = v18;
      }
      objc_msgSend(*(id *)&v3[8], "setContents:", RB::SharedSubsurface::contents((RB::SharedSubsurface *)&v3[10]));
      return objc_msgSend(*(id *)&v3[8], "setContentsRect:", *(_OWORD *)&v20, *(_OWORD *)&v19);
    }
  }
  return result;
}

- (RBLayer)init
{
  RBLayer *v2;
  RBLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBLayer;
  v2 = -[RBLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[RBLayer rb_init]((uint64_t)v2);
  return v3;
}

- (void)rb_init
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    *(_DWORD *)(a1 + 180) = 0;
    *(_QWORD *)(a1 + 184) = 0;
    *(_BYTE *)(a1 + 176) = 1;
    *(_BYTE *)(a1 + 177) = 1;
    *(_QWORD *)(a1 + 200) = 0;
    *(_QWORD *)(a1 + 208) = 0;
    *(_BYTE *)(a1 + 175) = 1;
    *(_QWORD *)(a1 + 192) = 3;
    *(_BYTE *)(a1 + 178) = 1;
    *(_QWORD *)(a1 + 152) = 0x3FB999999999999ALL;
    os_unfair_lock_lock((os_unfair_lock_t)v2);
    v3 = *(_QWORD *)(v2 + 16);
    if (*(_QWORD *)(v2 + 24) < (unint64_t)(v3 + 1))
    {
      RB::vector<unsigned long,0ul,unsigned long>::reserve_slow(v2 + 8, v3 + 1);
      v3 = *(_QWORD *)(v2 + 16);
    }
    *(_QWORD *)(*(_QWORD *)(v2 + 8) + 8 * v3) = a1;
    ++*(_QWORD *)(v2 + 16);
    os_unfair_lock_unlock((os_unfair_lock_t)v2);
  }
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  id *v5;
  objc_super v6;
  _QWORD block[5];

  v3 = a3;
  if (a3)
  {
    if (*((_BYTE *)self + 170) && !+[RBDevice isRunningInBackground](RBDevice, "isRunningInBackground"))
    {
      -[RBLayer setNeedsSynchronousUpdate:](self, "setNeedsSynchronousUpdate:", 1);
      -[RBLayer setNeedsDisplay](self, "setNeedsDisplay");
      *((_BYTE *)self + 170) = 0;
    }
  }
  else if (!*((_BYTE *)self + 171))
  {
    v5 = (id *)operator new();
    objc_initWeakOrNil(v5, self);
    *((_BYTE *)self + 171) = 1;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__RBLayer_layerDidBecomeVisible___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  *((_BYTE *)self + 169) = v3;
  v6.receiver = self;
  v6.super_class = (Class)RBLayer;
  -[RBLayer layerDidBecomeVisible:](&v6, sel_layerDidBecomeVisible_, v3);
}

- (int64_t)maxDrawableCount
{
  return *((_QWORD *)self + 24);
}

- (BOOL)needsSynchronousUpdate
{
  return *((_BYTE *)self + 175);
}

- (BOOL)isDrawableAvailable
{
  BOOL v3;
  os_unfair_lock_s *v4;

  if (+[RBDevice isRunningInBackground](RBDevice, "isRunningInBackground"))
    return 0;
  v4 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  v3 = -[RBLayer needsSynchronousUpdate](self, "needsSynchronousUpdate")
    || !*((_QWORD *)self + 7)
    || CAImageQueueCollect() != 0;
  os_unfair_lock_unlock(v4);
  return v3;
}

- (void)_RBDrawableStatisticsDidChange
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  v4 = (id)*((_QWORD *)self + 20);
  if (v4)
  {

    v4 = v4;
    os_unfair_lock_unlock(v3);
    if (v4)
      (*((void (**)(id, RBLayer *))v4 + 2))(v4, self);
  }
  else
  {
    os_unfair_lock_unlock(v3);
  }

}

- (RBLayer)initWithCoder:(id)a3
{
  RBLayer *v3;
  RBLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBLayer;
  v3 = -[RBLayer initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[RBLayer rb_init]((uint64_t)v3);
  return v4;
}

- (RBLayer)initWithLayer:(id)a3
{
  RBLayer *v4;
  RBLayer *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RBLayer;
  v4 = -[RBLayer initWithLayer:](&v9, sel_initWithLayer_);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)*((_QWORD *)a3 + 5);
    v7 = (void *)*((_QWORD *)v4 + 5);
    if (v7 != v6)
    {

      *((_QWORD *)v5 + 5) = v6;
    }
    *((_BYTE *)v5 + 174) = *((_BYTE *)a3 + 174);
    *((_DWORD *)v5 + 45) = *((_DWORD *)a3 + 45);
    *((_QWORD *)v5 + 23) = 0;
    *((_BYTE *)v5 + 176) = *((_BYTE *)a3 + 176);
    *((_BYTE *)v5 + 177) = *((_BYTE *)a3 + 177);
    *(_OWORD *)((char *)v5 + 200) = *(_OWORD *)((char *)a3 + 200);
    *((_QWORD *)v5 + 24) = *((_QWORD *)a3 + 24);
    *((_BYTE *)v5 + 178) = *((_BYTE *)a3 + 178);
    *((_BYTE *)v5 + 179) = *((_BYTE *)a3 + 179);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3;
  RBLayer **v4;
  uint64_t v5;
  RBLayer **v6;
  uint64_t v7;
  uint64_t v8;
  RBLayer **v9;
  RBLayer *v10;
  RB::SurfacePool *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  os_unfair_lock_lock((os_unfair_lock_t)v3);
  v4 = *(RBLayer ***)(v3 + 8);
  v5 = *(_QWORD *)(v3 + 16);
  v6 = v4;
  if (v5)
  {
    v7 = 8 * v5;
    v6 = *(RBLayer ***)(v3 + 8);
    while (*v6 != self)
    {
      ++v6;
      v7 -= 8;
      if (!v7)
      {
        v6 = &v4[v5];
        break;
      }
    }
  }
  v8 = v6 - v4;
  if (v8 != v5)
  {
    v9 = &v4[v5];
    v10 = v4[v8];
    v4[v8] = *(v9 - 1);
    *(v9 - 1) = v10;
    --*(_QWORD *)(v3 + 16);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v3);
  v12 = (os_unfair_lock_s *)RB::SurfacePool::shared(v11);
  RB::SurfacePool::unwatch_queues(v12, (CALayer *)self);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  *((_BYTE *)self + 168) = 1;
  v13 = *((_QWORD *)self + 6);
  if (v13)
    RB::Drawable::set_delegate(v13, 0);
  v14 = *((_QWORD *)self + 17);
  if (v14)
    *(_QWORD *)(v14 + 16) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
  v15.receiver = self;
  v15.super_class = (Class)RBLayer;
  -[RBLayer dealloc](&v15, sel_dealloc);
}

- (void)setDevice:(id)a3
{
  os_unfair_lock_s *v5;
  id v6;

  v5 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  v6 = (id)*((_QWORD *)self + 5);
  if (v6 != a3)
  {

    *((_QWORD *)self + 5) = a3;
  }
  os_unfair_lock_unlock(v5);
}

- (RBDevice)device
{
  os_unfair_lock_s *v3;
  RBDevice *v4;

  v3 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  v4 = (RBDevice *)*((id *)self + 5);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)setPixelFormat:(unint64_t)a3
{
  unint64_t v5;

  if (RB::pixel_format_traits(a3, (MTLPixelFormat)a2)[3])
    v5 = a3;
  else
    v5 = 0;
  *((_QWORD *)self + 23) = v5;
}

void __38__RBLayer_displayWithBounds_callback___block_invoke_27(uint64_t a1)
{
  int8x8_t v1;
  int32x2_t v3;
  void *v4;
  id v5;
  int8x8_t v6;
  double v7;
  uint64_t v8;
  RB::Device *v9;
  uint64_t v10;
  double v11;
  char v12;
  char v13;
  char HasExtendedRange;
  float v15;
  const RB::DisplayList::Contents *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _CAImageQueue *v20;
  RB::Surface *v21;
  uint64_t v22;
  double v23;
  os_unfair_lock_s *v24;
  RB::Surface *v25;
  RB::SurfacePool *v26;
  char v27;
  double v28;
  uint64_t inserted;
  unsigned __int8 v30;
  os_unfair_lock_s *v31;
  RB::SurfacePool *v32;
  const char *v33;
  __int128 v34;
  int32x2_t v35;
  char v36;
  _QWORD v37[2];
  RB::Surface *(*v38)(uint64_t, MTLPixelFormat);
  void *v39;
  uint64_t *v40;
  id v41;
  id v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v3 = *(int32x2_t *)(a1 + 56);
  v1.i8[0] = *(_BYTE *)(a1 + 144);
  v4 = (void *)MEMORY[0x20BD168EC]();
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3321888768;
  v38 = __38__RBLayer_displayWithBounds_callback___block_invoke_2;
  v39 = &unk_24C224310;
  v40 = &v48;
  v41 = *(id *)(a1 + 64);
  v5 = *(id *)(a1 + 72);
  v6.i32[0] = 0;
  v7 = COERCE_DOUBLE(vbsl_s8(vdup_lane_s8(vceq_s8(v1, v6), 0), (int8x8_t)v3, (int8x8_t)(*(_QWORD *)&vadd_s32(v3, (int32x2_t)0x1F0000001FLL) & 0xFFFFFFE0FFFFFFE0)));
  v42 = v5;
  v43 = v7;
  v8 = *(_QWORD *)(a1 + 88);
  v44 = *(_QWORD *)(a1 + 80);
  v47 = *(_BYTE *)(a1 + 145);
  v46 = *(_DWORD *)(a1 + 128);
  v45 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(v8 + 172) && (((void (*)(_QWORD *))v38)(v37), !v49[3]))
  {
    RB::Drawable::cancel_frame(*(RB::Drawable **)(a1 + 96));
  }
  else
  {
    v9 = (RB::Device *)-[RBDecodedFontMetadata fontUID](*(_QWORD *)(a1 + 72));
    RB::RenderFrame::RenderFrame((RB::RenderFrame *)v52, v9, *(RB::Drawable **)(a1 + 96), 1u);
    v10 = *(_QWORD *)(a1 + 80);
    v11 = *(double *)(a1 + 104);
    v12 = *(_BYTE *)(a1 + 145);
    v13 = *(_BYTE *)(a1 + 146);
    HasExtendedRange = RBColorModeHasExtendedRange(*(_DWORD *)(a1 + 132));
    v15 = v11;
    RB::RenderParams::RenderParams((uint64_t)&v34, (uint64_t)v52, v10, v12, v13, HasExtendedRange, v7, v15);
    v36 = (v36 & 0xF3 | (4 * *(_BYTE *)(a1 + 147)) | (2 * *(_BYTE *)(a1 + 128)) & 8) ^ 4;
    v16 = (const RB::DisplayList::Contents *)objc_msgSend(*(id *)(a1 + 112), "_rb_contents");
    if (!v16)
      v16 = (const RB::DisplayList::Contents *)RB::DisplayList::Contents::empty_contents(0);
    RB::DisplayList::render(v16, &v34, (uint64_t)v37, *(_DWORD *)(a1 + 136), 0, 0, v35, *(__n128 *)(a1 + 32));
    if ((*(_BYTE *)(v52[0] + 292) & 2) != 0)
    {
      v17 = *(id *)(a1 + 112);
      if (v53 != v17)
      {

        v53 = v17;
      }
    }
    RB::RenderFrame::~RenderFrame((RB::RenderFrame *)v52);
  }

  objc_autoreleasePoolPop(v4);
  v18 = *(_QWORD *)(a1 + 64);
  if (!v18)
  {
    v19 = 0;
    goto LABEL_30;
  }
  v19 = *(_QWORD *)(v18 + 32);
  if (!v19)
  {
LABEL_30:
    v20 = 0;
    goto LABEL_13;
  }
  v20 = *(_CAImageQueue **)(v19 + 8);
LABEL_13:
  v21 = (RB::Surface *)v49[3];
  if (v21)
  {
    v21 = (RB::Surface *)RB::Surface::queue_id(v21, v20);
    if (v21)
    {
      v22 = operator new();
      *(_QWORD *)v22 = v49[3];
      *(_QWORD *)(v22 + 8) = v20;
      if (*(_BYTE *)(a1 + 148))
      {
        v23 = 0.0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 64), "timeOffset");
        v23 = v28 + 1.0;
      }
      CAImageQueueSetSize();
      inserted = CAImageQueueInsertImageWithRotation();
      if ((_DWORD)inserted)
      {
        -[RBImageQueueContents setSurface:](v19, (unsigned int *)v49[3]);
        if (!*(_BYTE *)(a1 + 148))
          v26 = (RB::SurfacePool *)objc_msgSend(*(id *)(a1 + 64), "setTimeOffset:", v23);
      }
      else
      {
        v30 = atomic_load((unsigned __int8 *)&_ZGVZZZ38__RBLayer_displayWithBounds_callback__EUb_ENK3__0clIPNSt3__14pairIPN2RB7SurfaceEP13_CAImageQueueEEEEDajyT_E9log_stats);
        if ((v30 & 1) == 0)
        {
          inserted = __cxa_guard_acquire(&_ZGVZZZ38__RBLayer_displayWithBounds_callback__EUb_ENK3__0clIPNSt3__14pairIPN2RB7SurfaceEP13_CAImageQueueEEEEDajyT_E9log_stats);
          if ((_DWORD)inserted)
          {
            RB::debug_BOOL((RB *)"RB_PRINT_FRAME_STATS", v33);
            __cxa_guard_release(&_ZGVZZZ38__RBLayer_displayWithBounds_callback__EUb_ENK3__0clIPNSt3__14pairIPN2RB7SurfaceEP13_CAImageQueueEEEEDajyT_E9log_stats);
          }
        }
        v31 = (os_unfair_lock_s *)RB::SurfacePool::shared((RB::SurfacePool *)inserted);
        RB::SurfacePool::dealloc(v31, *(RB::Surface **)v22, *(_CAImageQueue **)(v22 + 8));
        v26 = (RB::SurfacePool *)MEMORY[0x20BD16544](v22, 0x20C40A4A59CD2);
      }
      v27 = 0;
      goto LABEL_27;
    }
  }
  v24 = (os_unfair_lock_s *)RB::SurfacePool::shared(v21);
  v25 = (RB::Surface *)v49[3];
  if (!v25)
  {
    RB::SurfacePool::watch_queue(v24, (CALayer *)v20, *(CALayer **)(a1 + 88));
    v27 = 1;
LABEL_27:
    *(_BYTE *)(*(_QWORD *)(a1 + 88) + 172) = v27;
    goto LABEL_28;
  }
  RB::SurfacePool::dealloc(v24, v25, v20);
LABEL_28:
  v32 = (RB::SurfacePool *)RB::SurfacePool::shared(v26);
  RB::SurfacePool::collect_async(v32);
  RBXMLRecorderMarkFrame(*(const void **)(a1 + 48), *(void **)(a1 + 112), *(unsigned __int8 *)(a1 + 145), (double)(int)*(_QWORD *)(a1 + 120), (double)(int)HIDWORD(*(_QWORD *)(a1 + 120)));
  _Block_object_dispose(&v48, 8);
}

- (BOOL)_willMoveSubsurface:(unsigned int)a3
{
  os_unfair_lock_s *v5;
  _BOOL4 v6;

  v5 = (os_unfair_lock_s *)((char *)self + 32);
  v6 = os_unfair_lock_trylock((os_unfair_lock_t)self + 8);
  if (v6)
  {
    if ((*((_BYTE *)self + 168) & 1) != 0 || *((_DWORD *)self + 32) != a3)
    {
      os_unfair_lock_unlock(v5);
      LOBYTE(v6) = 0;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (void)_moveSubsurface:(void *)a3
{
  -[RBLayer _updateSubsurface:]((uint64_t)self, (int32x2_t *)a3);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
}

- (void)waitUntilAsyncRenderingCompleted
{
  const char *v3;
  os_unfair_lock_s *v4;
  RB::SharedSurfaceGroup **v5;
  unsigned int *v6;
  unsigned int v7;
  intptr_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;

  if (!pthread_main_np() && (*((_BYTE *)self + 168) & 1) == 0)
    RB::precondition_failure((RB *)"%s may only be called on main thread", v3, "-[RBLayer waitUntilAsyncRenderingCompleted]");
  v4 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  v5 = (RB::SharedSurfaceGroup **)*((_QWORD *)self + 9);
  if (v5)
  {
    v6 = (unsigned int *)(v5 + 1);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = *((_QWORD *)self + 6);
  if (v8)
  {
    v9 = (unsigned int *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  os_unfair_lock_unlock(v4);
  if (v5)
    RB::SharedSurfaceGroup::finish_async(v5[2]);
  if (!v8)
    goto LABEL_15;
  RB::Drawable::finish(v8);
  v11 = (unsigned int *)(v8 + 8);
  do
  {
    v12 = __ldxr(v11);
    v13 = v12 - 1;
  }
  while (__stlxr(v13, v11));
  if (!v13)
  {
    __dmb(9u);
    (*(void (**)(intptr_t))(*(_QWORD *)v8 + 8))(v8);
    if (!v5)
      return;
  }
  else
  {
LABEL_15:
    if (!v5)
      return;
  }
  v14 = (unsigned int *)(v5 + 1);
  do
  {
    v15 = __ldxr(v14);
    v16 = v15 - 1;
  }
  while (__stlxr(v16, v14));
  if (!v16)
  {
    __dmb(9u);
    (*((void (**)(RB::SharedSurfaceGroup **))*v5 + 1))(v5);
  }
}

- (void)setContents:(id)a3
{
  void *v5;
  objc_super v6;

  if ((id)-[RBLayer contents](self, "contents") != a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)self + 8);
    v5 = (void *)*((_QWORD *)self + 7);
    *((_QWORD *)self + 7) = 0;
    -[RBLayer _clearSubsurface]((uint64_t)self);
    *((_BYTE *)self + 170) = 0;
    -[RBLayer updateColor](self);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
    objc_msgSend(v5, "removeFromSuperlayer");

  }
  v6.receiver = self;
  v6.super_class = (Class)RBLayer;
  -[RBLayer setContents:](&v6, sel_setContents_, a3);
}

+ (void)willEnterForeground
{
  _anonymous_namespace_::AllLayers *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  id *v8;
  id *v9;
  uint64_t v10;
  _BYTE *v11;
  unint64_t i;
  id *v13;
  unint64_t v14;
  unint64_t v15;

  v0 = (_anonymous_namespace_::AllLayers *)objc_opt_self();
  v13 = 0;
  v14 = 0;
  v15 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)v1);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 8);
    v4 = 8 * v2;
    do
    {
      v5 = *(_BYTE **)v3;
      if (*(_BYTE *)(*(_QWORD *)v3 + 169) && v5[170])
      {
        v6 = v5;
        v7 = v14;
        if (v15 < v14 + 1)
        {
          RB::vector<unsigned long,0ul,unsigned long>::reserve_slow((uint64_t)&v13, v14 + 1);
          v7 = v14;
        }
        v8 = v13;
        v8[v7] = v6;
        ++v14;

      }
      v3 += 8;
      v4 -= 8;
    }
    while (v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v1);
  v9 = v13;
  if (v14)
  {
    v10 = 8 * v14;
    do
    {
      objc_msgSend(*v9, "setNeedsSynchronousUpdate:", 1);
      objc_msgSend(*v9, "setNeedsDisplay");
      v11 = *v9++;
      v11[170] = 0;
      v10 -= 8;
    }
    while (v10);
    v9 = v13;
    if (v14)
    {
      for (i = 0; i < v14; ++i)

      v9 = v13;
    }
  }
  if (v9)
    free(v9);
}

void __33__RBLayer_layerDidBecomeVisible___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  int v3;
  id *v4;

  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(*(id **)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "lock");
    WeakRetained[171] = 0;
    v3 = WeakRetained[169];
    objc_msgSend(MEMORY[0x24BDE57D8], "unlock");
    if (!v3)
    {
      objc_msgSend(WeakRetained, "setContents:", 0);
      WeakRetained[170] = 1;
    }
  }
  v4 = *(id **)(a1 + 32);
  if (v4)
  {
    objc_destroyWeak(v4);
    MEMORY[0x20BD16544](v4, 0x80C40B8603338);
  }

}

- (void)resetStatistics:(unint64_t)a3 alpha:(double)a4
{
  RBLayer *v6;
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  unsigned int *p_os_unfair_lock_opaque;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;

  v6 = self;
  v7 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  *((_QWORD *)v6 + 18) = a3;
  *((double *)v6 + 19) = a4;
  v8 = (os_unfair_lock_s *)*((_QWORD *)v6 + 6);
  if (v8)
  {
    p_os_unfair_lock_opaque = &v8[2]._os_unfair_lock_opaque;
    do
      v10 = __ldxr(p_os_unfair_lock_opaque);
    while (__stxr(v10 + 1, p_os_unfair_lock_opaque));
  }
  if (a3)
  {
    if (!*((_QWORD *)v6 + 20))
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(v7);
  if (v8)
  {
    RB::Drawable::reset_statistics(v8, a3, a4);
    RB::Drawable::set_delegate((uint64_t)v8, (uint64_t)v6);
    v11 = &v8[2]._os_unfair_lock_opaque;
    do
    {
      v12 = __ldxr(v11);
      v13 = v12 - 1;
    }
    while (__stlxr(v13, v11));
    if (!v13)
    {
      __dmb(9u);
      (*(void (**)(os_unfair_lock_s *))(*(_QWORD *)&v8->_os_unfair_lock_opaque + 8))(v8);
    }
  }
}

- (NSDictionary)statistics
{
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  unsigned int *p_os_unfair_lock_opaque;
  unsigned int v6;
  NSDictionary *v7;
  unsigned int v8;
  unsigned int v9;
  _BYTE v11[288];

  v3 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  v4 = (os_unfair_lock_s *)*((_QWORD *)self + 6);
  if (v4)
  {
    p_os_unfair_lock_opaque = &v4[2]._os_unfair_lock_opaque;
    do
      v6 = __ldxr(p_os_unfair_lock_opaque);
    while (__stxr(v6 + 1, p_os_unfair_lock_opaque));
    os_unfair_lock_unlock(v3);
    RB::Drawable::statistics(v4, v11);
    v7 = (NSDictionary *)RB::Drawable::Statistics::dictionary((RB::Drawable::Statistics *)v11);
    do
    {
      v8 = __ldxr(p_os_unfair_lock_opaque);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, p_os_unfair_lock_opaque));
    if (!v9)
    {
      __dmb(9u);
      (*(void (**)(os_unfair_lock_s *))(*(_QWORD *)&v4->_os_unfair_lock_opaque + 8))(v4);
    }
  }
  else
  {
    os_unfair_lock_unlock(v3);
    return (NSDictionary *)MEMORY[0x24BDBD1B8];
  }
  return v7;
}

- (id)statisticsHandler
{
  os_unfair_lock_s *v3;
  void *v4;

  v3 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  v4 = (void *)*((_QWORD *)self + 20);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)setStatisticsHandler:(id)a3
{
  os_unfair_lock_s *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;
  RBLayer *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;

  v5 = (os_unfair_lock_s *)((char *)self + 32);
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  if (*((id *)self + 20) != a3)
  {
    v6 = objc_msgSend(a3, "copy");

    *((_QWORD *)self + 20) = v6;
  }
  v7 = (unsigned int *)*((_QWORD *)self + 6);
  if (v7)
  {
    v8 = v7 + 2;
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = *((_QWORD *)self + 18);
  os_unfair_lock_unlock(v5);
  if (v7)
  {
    if (v10)
      v11 = a3 == 0;
    else
      v11 = 1;
    if (v11)
      v12 = 0;
    else
      v12 = self;
    RB::Drawable::set_delegate(*((_QWORD *)self + 6), (uint64_t)v12);
    v13 = v7 + 2;
    do
    {
      v14 = __ldxr(v13);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, v13));
    if (!v15)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 8))(v7);
    }
  }
}

- (void)copyImageInRect:(CGRect)a3 options:(id)a4 completionQueue:(id)a5 handler:(id)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  _QWORD *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  RBDevice *v21;
  RBDevice *v22;
  unsigned int *v23;
  unsigned int *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  int v35;
  int v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  unsigned int v41;
  unsigned int v42;
  __int32 v43;
  float v44;
  int v45;
  id v51;
  void *v52;
  unsigned int *v53;
  unsigned int v54;
  int v55;
  RB::Drawable *v56;
  unsigned int *v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int *v60;
  unsigned int v61;
  unsigned int v62;
  float32x4_t v63;
  RB::Drawable *v64;
  _QWORD v65[4];
  float32x4_t v66;
  id v67;
  double v68;
  double v69;
  id v70;
  id v71;
  RB::Drawable *v72;
  double v73;
  id v74;
  uint64_t v75;
  int v76;
  int v77;
  int v78;
  char v79;
  _DWORD v80[4];
  _QWORD v81[6];
  uint64_t v82;
  _QWORD v83[5];
  _QWORD block[5];
  _QWORD v85[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (+[RBDevice isRunningInBackground](RBDevice, "isRunningInBackground"))
  {
    v85[0] = MEMORY[0x24BDAC760];
    v85[1] = 3221225472;
    v85[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke;
    v85[3] = &unk_24C22AB80;
    v85[4] = a6;
    v14 = v85;
LABEL_20:
    dispatch_async((dispatch_queue_t)a5, v14);
    return;
  }
  v15 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBLayerCopyImageScale);
  if (!v15 || (objc_msgSend(v15, "doubleValue"), v17 = v16, v16 <= 0.0))
  {
    -[RBLayer contentsScale](self, "contentsScale");
    v17 = v18;
  }
  v19 = ceil(v17 * width);
  if (v19 <= 0.0 || (v20 = ceil(v17 * height), v20 <= 0.0))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_2;
    block[3] = &unk_24C22AB80;
    block[4] = a6;
    v14 = block;
    goto LABEL_20;
  }
  os_unfair_lock_lock((os_unfair_lock_t)self + 8);
  v21 = current_device_locked(self);
  if (v21 && (0, (v22 = v21) != 0))
  {
    ensure_drawable_locked(self);
    v23 = (unsigned int *)*((_QWORD *)self + 6);
    if (v23)
    {
      v24 = v23 + 2;
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    v64 = (RB::Drawable *)v23;
    os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
    v26 = -[RBLayer colorMode](self, "colorMode");
    v27 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBLayerCopyImageColorMode);
    if (v27)
      v26 = objc_msgSend(v27, "intValue");
    RB::ColorMode::ColorMode(&v82, v26);
    v28 = (void *)objc_opt_new();
    objc_msgSend(v28, "setProfile:", 2);
    objc_msgSend(v28, "setDefaultColorSpace:", rb_color_space(((v82 & 0x100000000) == 0) | 0x100u));
    objc_msgSend(v28, "setContentRect:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v19, v20);
    *(double *)v81 = v17;
    v81[1] = 0;
    v81[2] = 0;
    *(double *)&v81[3] = v17;
    *(CGFloat *)&v81[4] = x;
    *(CGFloat *)&v81[5] = y;
    objc_msgSend(v28, "concat:", v81);
    -[RBLayer drawInDisplayList:](self, "drawInDisplayList:", v28);
    v29 = objc_msgSend(v28, "_rb_contents");
    if (v29)
    {
      v30 = RB::DisplayList::Layer::output_depth((RB::DisplayList::Layer *)(v29 + 320));
      LOBYTE(v82) = RB::max_color_depth(v82, v30);
    }
    v31 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBLayerCopyImageOpaque);
    if (v31)
      v32 = objc_msgSend(v31, "BOOLValue");
    else
      v32 = -[RBLayer isOpaque](self, "isOpaque");
    v33 = v32;
    v34 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBLayerCopyImagePromotesFramebuffer);
    if (v34)
      v35 = objc_msgSend(v34, "BOOLValue");
    else
      v35 = -[RBLayer promotesFramebuffer](self, "promotesFramebuffer");
    if (v33)
      v36 = 8;
    else
      v36 = 9;
    if (v35)
      v37 = v36;
    else
      v37 = v36 | 0x20;
    v38 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBLayerCopyImageClearsBackground);
    if (v38)
      v39 = objc_msgSend(v38, "BOOLValue");
    else
      v39 = -[RBLayer clearsBackground](self, "clearsBackground");
    if (v39)
    {
      v40 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", RBLayerCopyImageClearColor);
      if (v40)
      {
        objc_msgSend(v40, "getValue:size:", v80, 16);
        v41 = v80[0];
        v42 = v80[1];
        v43 = v80[2];
        v44 = *(float *)&v80[3];
      }
      else
      {
        -[RBLayer clearColor](self, "clearColor");
      }
      __asm { FMOV            V4.4S, #1.0 }
      _Q4.i64[0] = __PAIR64__(v42, v41);
      _Q4.i32[2] = v43;
      v63 = vmulq_n_f32(_Q4, v44);
      v45 = 2;
    }
    else
    {
      v45 = 0;
      v63 = 0u;
    }
    v51 = a5;
    v52 = (void *)objc_msgSend(a6, "copy");
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3321888768;
    v65[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_4;
    v65[3] = &__block_descriptor_133_e16_48c30_ZTSN2RB8objc_ptrIP8RBDeviceEE72c61_ZTSN2RB8objc_ptrIPU28objcproto17OS_dispatch_queue8NSObjectEE80c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7CGImageEEE88c40_ZTSN2RB14refcounted_ptrINS_8DrawableEEE104c36_ZTSN2RB8objc_ptrIP13RBDisplayListEE_e5_v8__0l;
    v67 = v22;
    v75 = v82;
    v76 = v37;
    v68 = v19;
    v69 = v20;
    v70 = v51;
    v71 = v52;
    if (v64)
    {
      v53 = (unsigned int *)((char *)v64 + 8);
      do
        v54 = __ldxr(v53);
      while (__stxr(v54 + 1, v53));
    }
    v72 = v64;
    v73 = v17;
    v77 = v26;
    v79 = v33;
    v74 = v28;
    v78 = v45;
    v66 = v63;
    RB::Drawable::begin_frame(v64);
    dispatch_async((dispatch_queue_t)-[RBDevice queue](v22, "queue"), v65);
    v55 = RB::ColorMode::output_space((RB::ColorMode *)&v82);
    RBXMLRecorderMarkFrame(self, v28, v55, v19, v20);

    v56 = v72;
    if (v72)
    {
      v57 = (unsigned int *)((char *)v72 + 8);
      do
      {
        v58 = __ldxr(v57);
        v59 = v58 - 1;
      }
      while (__stlxr(v59, v57));
      if (!v59)
      {
        __dmb(9u);
        (*(void (**)(RB::Drawable *))(*(_QWORD *)v56 + 8))(v56);
      }
    }

    if (v64)
    {
      v60 = (unsigned int *)((char *)v64 + 8);
      do
      {
        v61 = __ldxr(v60);
        v62 = v61 - 1;
      }
      while (__stlxr(v62, v60));
      if (!v62)
      {
        __dmb(9u);
        (*(void (**)(RB::Drawable *))(*(_QWORD *)v64 + 8))(v64);
      }
    }
  }
  else
  {
    v83[0] = MEMORY[0x24BDAC760];
    v83[1] = 3221225472;
    v83[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_3;
    v83[3] = &unk_24C22AB80;
    v83[4] = a6;
    dispatch_async((dispatch_queue_t)a5, v83);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 8);
    v22 = 0;
  }

}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_4(uint64_t a1)
{
  float *v2;
  RB *v3;
  MTLPixelFormat v4;
  RB *v5;
  char v6;
  int32x2_t v7;
  uint64_t v8;
  uint64_t v9;
  int32x2_t v10;
  const float *v11;
  int32x2_t v12;
  uint32x2_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  double v18;
  char v19;
  char v20;
  char HasExtendedRange;
  float v22;
  const RB::DisplayList::Contents *v23;
  uint64_t v24;
  NSObject *global_queue;
  NSObject *v26;
  int32x2_t v27;
  double v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  int32x2_t v32;
  char v33;
  _QWORD v34[8];
  id v35;
  id v36;
  uint64_t v37;
  char v38;
  char v39;
  _QWORD v40[2];
  uint64_t (*v41)(uint64_t);
  void *v42;
  _QWORD *v43;
  uint64_t v44;
  int32x2_t v45;
  float *v46;
  BOOL v47;
  _QWORD v48[6];
  id v49;
  _QWORD block[4];
  id v51;
  int v52;
  __int16 v53;
  _BYTE v54[304];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v2 = (float *)-[RBDecodedFontMetadata fontUID](*(_QWORD *)(a1 + 48));
  v53 = 0;
  v52 = 0;
  v3 = (RB *)RB::ColorMode::pixel_format((unsigned __int8 *)(a1 + 112), (uint64_t)v2, *(_DWORD *)(a1 + 120), (_BYTE *)&v53 + 1, (BOOL *)&v53, &v52);
  v5 = v3;
  v6 = 0;
  v7 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)(a1 + 56)));
  v8 = 10;
  v9 = (uint64_t)v3;
  v10 = v7;
  switch((unint64_t)v3)
  {
    case 0x80000001uLL:
    case 0x80000002uLL:
      goto LABEL_10;
    case 0x80000003uLL:
      v8 = 25;
LABEL_10:
      v10.i32[1] = v7.i32[1];
      v10.i32[0] = 3 * v7.i32[0];
      v6 = 1;
      v9 = v8;
      goto LABEL_13;
    case 0x80000004uLL:
    case 0x80000006uLL:
      goto LABEL_13;
    case 0x80000005uLL:
      v6 = 0;
      v9 = 23;
      goto LABEL_12;
    case 0x80000007uLL:
    case 0x80000008uLL:
      v6 = 0;
      v9 = 80;
      goto LABEL_12;
    case 0x80000009uLL:
    case 0x8000000AuLL:
      v6 = 0;
      v9 = 70;
      goto LABEL_12;
    case 0x8000000BuLL:
    case 0x8000000CuLL:
      v6 = 0;
      v9 = 115;
      goto LABEL_12;
    default:
      v9 = (uint64_t)v3;
      v10 = v7;
      if (v3 != (RB *)43)
        goto LABEL_13;
      v6 = 0;
      if (*((_BYTE *)v2 + 284))
        v9 = 43;
      else
        v9 = 23;
LABEL_12:
      v10 = v7;
LABEL_13:
      v27 = v10;
      v28 = *(double *)&v7;
      v11 = v2 + 72;
      v12 = (int32x2_t)vld1_dup_f32(v11);
      v13 = (uint32x2_t)vand_s8((int8x8_t)vcge_s32(v12, v10), (int8x8_t)vcgtz_s32(v10));
      v14 = MEMORY[0x24BDAC760];
      if ((vpmin_u32(v13, v13).u32[0] & 0x80000000) == 0)
      {
        v15 = RB::error_log(v3);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_4_cold_1(v5, v15, v28);
        block[0] = v14;
        block[1] = 3321888768;
        block[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_42;
        block[3] = &__block_descriptor_40_e8_32c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7CGImageEEE_e5_v8__0l;
        v16 = *(NSObject **)(a1 + 72);
        v51 = *(id *)(a1 + 80);
        dispatch_async(v16, block);

      }
      v17 = ((unint64_t)*((unsigned __int16 *)RB::pixel_format_traits((unint64_t)v5, v4) + 2) << 32) & 0x30000000000;
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x3812000000;
      v48[3] = __Block_byref_object_copy__4;
      v48[4] = __Block_byref_object_dispose__4;
      v49 = 0;
      v40[0] = v14;
      v40[1] = 3221225472;
      v41 = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_44;
      v42 = &unk_24C22B410;
      v43 = v48;
      v44 = v9;
      v45 = v27;
      v47 = v17 == 0x10000000000;
      v46 = v2;
      v34[0] = v14;
      v34[1] = 3321888768;
      v34[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_2_46;
      v34[3] = &unk_24C222EC8;
      v34[4] = v48;
      v34[5] = v5;
      *(double *)&v34[6] = v28;
      v34[7] = v27;
      v38 = HIBYTE(v53);
      v39 = v6;
      v37 = *(_QWORD *)(a1 + 112);
      v35 = *(id *)(a1 + 72);
      v36 = *(id *)(a1 + 80);
      RB::RenderFrame::RenderFrame((RB::RenderFrame *)v54, (RB::Device *)v2, *(RB::Drawable **)(a1 + 88), 0);
      v18 = *(double *)(a1 + 96);
      v19 = HIBYTE(v53);
      v20 = v53;
      HasExtendedRange = RBColorModeHasExtendedRange(*(_DWORD *)(a1 + 124));
      v22 = v18;
      RB::RenderParams::RenderParams((uint64_t)&v31, (uint64_t)v54, (uint64_t)v5, v19, v20, HasExtendedRange, v28, v22);
      v33 = (v33 & 0xF3 | (4 * *(_BYTE *)(a1 + 132)) | (2 * v52) & 8) ^ 4;
      v23 = (const RB::DisplayList::Contents *)objc_msgSend(*(id *)(a1 + 104), "_rb_contents");
      if (v23)
      {
        RB::DisplayList::render(v23, &v31, (uint64_t)v40, *(_DWORD *)(a1 + 128), 0, 0, v32, *(__n128 *)(a1 + 32));
        v24 = v41((uint64_t)v40);
      }
      else
      {
        v24 = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_44((uint64_t)v40);
      }
      if (v24)
      {
        RBStrokeRef::clip(v54);
        global_queue = dispatch_get_global_queue(2, 0);
        RB::RenderFrame::add_continuation((uint64_t)v54, global_queue, v34);
      }
      else
      {
        v29[0] = v14;
        v29[1] = 3321888768;
        v29[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_49;
        v29[3] = &__block_descriptor_40_e8_32c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7CGImageEEE_e5_v8__0l;
        v26 = *(NSObject **)(a1 + 72);
        v30 = *(id *)(a1 + 80);
        dispatch_async(v26, v29);

      }
      RB::RenderFrame::~RenderFrame((RB::RenderFrame *)v54);

      _Block_object_dispose(v48, 8);
      return;
  }
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_44(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (!result)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", *(_QWORD *)(a1 + 40), (int)*(_QWORD *)(a1 + 48), (int)HIDWORD(*(_QWORD *)(a1 + 48)), 0);
    objc_msgSend(v3, "setUsage:", 5);
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(v3, "setUsage:", objc_msgSend(v3, "usage") | 2);
    objc_msgSend(v3, "setStorageMode:", 0);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "newTextureWithDescriptor:", v3);

    *(_QWORD *)(v4 + 48) = v5;
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  }
  return result;
}

void __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_2_46(uint64_t a1, MTLPixelFormat a2)
{
  uint64_t v3;
  size_t v4;
  int v5;
  size_t v6;
  void *v7;
  void *v8;
  CGDataProvider *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  MTLPixelFormat v13;
  unsigned int *v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  CGBitmapInfo v19;
  size_t v20;
  CGImageRef v21;
  NSObject *v22;
  CFTypeRef v23;
  int v24;
  _QWORD block[4];
  id v26;
  CFTypeRef cf;
  _QWORD v28[3];
  __int128 v29;
  uint64_t v30;

  v3 = *((unsigned __int8 *)RB::pixel_format_traits(*(_QWORD *)(a1 + 40), a2) + 6);
  v24 = HIDWORD(*(_QWORD *)(a1 + 48));
  v4 = (*(_QWORD *)(a1 + 48) * (_DWORD)v3 + 63) & 0xFFFFFFC0;
  v5 = getpagesize();
  v6 = (v4 * v24 + v5 - 1) & -(uint64_t)v5;
  v7 = mmap(0, v6, 3, 4098, -1, 0);
  if (v7 != (void *)-1)
  {
    v8 = v7;
    v9 = CGDataProviderCreateWithData(0, v7, v6, (CGDataProviderReleaseDataCallback)_ZZZZ59__RBLayer_copyImageInRect_options_completionQueue_handler__EUb0_EUb1_EN3__18__invokeIPvPKvmEEDaT_T0_T1_);
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    v11 = *(_QWORD *)(a1 + 56);
    memset(v28, 0, sizeof(v28));
    *(_QWORD *)&v12 = (int)v11;
    *((_QWORD *)&v12 + 1) = SHIDWORD(v11);
    v29 = v12;
    v30 = 1;
    objc_msgSend(v10, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v8, v4, v28, 0);
    v14 = RB::pixel_format_traits(*(_QWORD *)(a1 + 40), v13);
    v15 = *v14 | ((unint64_t)*((unsigned __int16 *)v14 + 2) << 32);
    v16 = (char *)*(unsigned __int8 *)(a1 + 88);
    if ((v15 & 0x200000000) != 0)
    {
      v17 = RB::cg_color_space(v16, 1);
      if (*(_BYTE *)(a1 + 89))
        v19 = 4352;
      else
        v19 = 4353;
      v20 = 16;
    }
    else
    {
      v17 = RB::cg_color_space((char *)(v16 | 1), *(_BYTE *)(a1 + 80) == 0);
      v18 = *(_QWORD *)(a1 + 40);
      v19 = 4102;
      v20 = 5;
      if (v18 != 43 && v18 != 2147483653)
      {
        if (*(_BYTE *)(a1 + 89))
          v19 = 0;
        else
          v19 = 8194;
        v20 = 8;
      }
    }
    v21 = CGImageCreate((int)*(_QWORD *)(a1 + 48), (int)HIDWORD(*(_QWORD *)(a1 + 48)), v20, 8 * v3, v4, (CGColorSpaceRef)v17, v19, v9, 0, 1, kCGRenderingIntentDefault);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3321888768;
    block[2] = __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_3_47;
    block[3] = &__block_descriptor_48_e8_32c48_ZTSN2RB8objc_ptrIU13block_pointerFvP7CGImageEEE40c27_ZTSN2RB6cf_ptrIP7CGImageEE_e5_v8__0l;
    v22 = *(NSObject **)(a1 + 64);
    v26 = *(id *)(a1 + 72);
    if (v21)
      v23 = CFRetain(v21);
    else
      v23 = 0;
    cf = v23;
    dispatch_async(v22, block);
    if (cf)
      CFRelease(cf);

    if (v21)
      CFRelease(v21);
    if (v9)
      CFRelease(v9);
  }
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_3_47(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)displayIfNeeded
{
  objc_super v2;

  if (!*((_BYTE *)self + 173))
  {
    v2.receiver = self;
    v2.super_class = (Class)RBLayer;
    -[RBLayer displayIfNeeded](&v2, sel_displayIfNeeded);
  }
}

- (void)renderInContext:(CGContext *)a3
{
  objc_super v4;

  *((_BYTE *)self + 173) = 1;
  v4.receiver = self;
  v4.super_class = (Class)RBLayer;
  -[RBLayer renderInContext:](&v4, sel_renderInContext_, a3);
  *((_BYTE *)self + 173) = 0;
}

- (void)_renderForegroundInContext:(CGContext *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  float v17;
  float v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BYTE v30[8];
  CGRect v31;

  -[RBLayer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  RB::ColorMode::ColorMode(v30, -[RBLayer colorMode](self, "colorMode"));
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setProfile:", 3);
  objc_msgSend(v13, "setDefaultColorSpace:", rb_color_space(((v30[4] & 1) == 0) | 0x100u));
  objc_msgSend(v13, "setContentRect:", v6, v8, v10, v12);
  objc_msgSend(v13, "beginLayer");
  if (-[RBLayer clearsBackground](self, "clearsBackground"))
  {
    -[RBLayer clearColor](self, "clearColor");
    v18 = v17;
    if (v17 != 0.0)
    {
      v19 = v14;
      v20 = v15;
      v21 = v16;
      v22 = (void *)objc_opt_new();
      v23 = (void *)objc_opt_new();
      LODWORD(v24) = v19;
      LODWORD(v25) = v20;
      LODWORD(v26) = v21;
      *(float *)&v27 = v18;
      objc_msgSend(v22, "setColor:", v24, v25, v26, v27);
      objc_msgSend(v23, "setRect:", v6, v8, v10, v12);
      LODWORD(v28) = 1.0;
      objc_msgSend(v13, "drawShape:fill:alpha:blendMode:", v23, v22, 0, v28);

    }
  }
  -[RBLayer drawInDisplayList:](self, "drawInDisplayList:", v13);
  LODWORD(v29) = 1.0;
  objc_msgSend(v13, "drawLayerWithAlpha:blendMode:", 0, v29);
  CGContextSaveGState(a3);
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  CGContextClipToRect(a3, v31);
  if ((-[RBLayer contentsAreFlipped](self, "contentsAreFlipped") & 1) == 0)
  {
    CGContextTranslateCTM(a3, 0.0, v12);
    CGContextScaleCTM(a3, 1.0, -1.0);
  }
  objc_msgSend(v13, "renderInContext:options:", a3, 0);
  CGContextRestoreGState(a3);

}

- (void)setNeedsSynchronousUpdate:(BOOL)a3
{
  *((_BYTE *)self + 175) = a3;
}

- (void)setPromotesFramebuffer:(BOOL)a3
{
  *((_BYTE *)self + 176) = a3;
}

- (void)setClearsBackground:(BOOL)a3
{
  *((_BYTE *)self + 177) = a3;
}

- (void)setClearColor:(id)a3
{
  *((_DWORD *)self + 50) = LODWORD(a3.var0);
  *((_DWORD *)self + 51) = LODWORD(a3.var1);
  *((_DWORD *)self + 52) = LODWORD(a3.var2);
  *((_DWORD *)self + 53) = LODWORD(a3.var3);
}

- (BOOL)allowsBottomLeftOrigin
{
  return *((_BYTE *)self + 179);
}

- (void)setAllowsBottomLeftOrigin:(BOOL)a3
{
  *((_BYTE *)self + 179) = a3;
}

- (void).cxx_destruct
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;

  v3 = (unsigned int *)*((_QWORD *)self + 17);
  if (v3)
  {
    v4 = v3 + 2;
    do
    {
      v5 = __ldxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v3 + 8))(v3);
    }
  }
  RB::SharedSubsurface::~SharedSubsurface((id *)self + 10);

  v7 = (unsigned int *)*((_QWORD *)self + 6);
  if (v7)
  {
    v8 = v7 + 2;
    do
    {
      v9 = __ldxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
    {
      __dmb(9u);
      (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 8))(v7);
    }
  }

}

- (void)displayWithBounds:(id *)a1 callback:.cold.1(id *a1)
{
  id *v1;
  id *v2;

  OUTLINED_FUNCTION_2(a1);

}

- (uint64_t)displayWithBounds:(uint64_t)result callback:.cold.2(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = (unsigned int *)(result + 8);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
    return OUTLINED_FUNCTION_1_0(result);
  return result;
}

- (void)displayWithBounds:(NSObject *)a3 callback:(double)a4 .cold.4(uint64_t a1, uint64_t a2, NSObject *a3, double a4)
{
  *(_DWORD *)a2 = 136315650;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = LODWORD(a4);
  *(_WORD *)(a2 + 18) = 1024;
  *(_DWORD *)(a2 + 20) = HIDWORD(a4);
  OUTLINED_FUNCTION_3(&dword_209ACA000, a3, (uint64_t)a3, "RBLayer: unable to create texture: %s, [%d, %d]", (uint8_t *)a2);
}

- (uint64_t)statistics
{
  return OUTLINED_FUNCTION_1_0(a1);
}

__n128 __59__RBLayer_copyImageInRect_options_completionQueue_handler___block_invoke_4_cold_1(RB *a1, NSObject *a2, double a3)
{
  uint64_t v4;
  __n128 result;
  int v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = 136315650;
  v8 = RB::pixel_format_name(a1, (MTLPixelFormat)a2);
  v9 = 1024;
  v10 = LODWORD(a3);
  v11 = 1024;
  v12 = HIDWORD(a3);
  OUTLINED_FUNCTION_3(&dword_209ACA000, a2, v4, "RBLayer: unable to create image texture: %s, [%d, %d]", (uint8_t *)&v7);
  return result;
}

@end
