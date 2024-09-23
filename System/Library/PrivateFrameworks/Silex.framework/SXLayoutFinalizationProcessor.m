@implementation SXLayoutFinalizationProcessor

- (SXLayoutFinalizationProcessor)initWithUnitConverterFactory:(id)a3
{
  id v5;
  SXLayoutFinalizationProcessor *v6;
  SXLayoutFinalizationProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLayoutFinalizationProcessor;
  v6 = -[SXLayoutFinalizationProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_unitConverterFactory, a3);

  return v7;
}

- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5
{
  -[SXLayoutFinalizationProcessor finalizeLayoutBlueprint:origin:absoluteOrigin:](self, "finalizeLayoutBlueprint:origin:absoluteOrigin:", a4, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (void)finalizeLayoutBlueprint:(id)a3 origin:(CGPoint)a4 absoluteOrigin:(CGPoint)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  SXUnitConverterFactory *unitConverterFactory;
  double Width;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  double v61;
  double v62;
  double height;
  double v64;
  double y;
  double x;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  v86 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v6, "componentIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v82 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(v6, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        unitConverterFactory = self->_unitConverterFactory;
        objc_msgSend(v11, "frame");
        Width = CGRectGetWidth(v87);
        objc_msgSend(v6, "blueprintSize");
        v15 = v14;
        objc_msgSend(v6, "layoutOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXUnitConverterFactory createUnitConverterWithComponentWidth:parentWidth:layoutOptions:](unitConverterFactory, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", v16, Width, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "componentSizer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layoutMarginsWithUnitConverter:", v17);
        v20 = v19;
        v75 = v19;
        v76 = v21;
        v22 = v21;
        v24 = v23;
        v26 = v25;

        objc_msgSend(v11, "componentSizer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "contentInsetsWithUnitConverter:", v17);
        v29 = v28;
        v71 = v30;
        v72 = v28;
        v31 = v30;
        v33 = v32;
        v73 = v34;
        v74 = v32;
        v35 = v34;

        objc_msgSend(v11, "componentSizer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "bordersInsetsWithUnitConverter:", v17);
        v77 = v37;
        v78 = v38;
        v79 = v39;
        v80 = v40;

        v41 = v29 - v20;
        v42 = v31 - v22;
        v70 = v33 - v24;
        v43 = v24;
        v67 = v24;
        v68 = v26;
        v69 = v35 - v26;
        v44 = v26;
        objc_msgSend(v11, "frame");
        v89 = CGRectOffset(v88, a5.x, a5.y);
        y = v89.origin.y;
        x = v89.origin.x;
        height = v89.size.height;
        v64 = v89.size.width;
        objc_msgSend(v11, "frame");
        v91 = CGRectOffset(v90, a4.x, a4.y);
        v61 = v91.origin.y;
        v62 = v91.origin.x;
        v45 = v91.size.width;
        v46 = v91.size.height;
        v47 = v91.size.width - (v76 + v44) - (-v80 - v79);
        v48 = v91.size.height - (v75 + v43) - (-v78 - v77);
        objc_msgSend(v11, "setAbsoluteFrame:", x, y, v64, height);
        objc_msgSend(v11, "setComponentViewFrame:", v62, v61, v45, v46);
        objc_msgSend(v11, "setContentViewFrame:", v79 + 0.0, v77 + 0.0, v47 - (v79 + v80), v48 - (v77 + v78));
        objc_msgSend(v11, "setContentFrame:", v42 + 0.0, v41 + 0.0, v47 - (v79 + v80) - (v42 + v69), v48 - (v77 + v78) - (v41 + v70));
        objc_msgSend(v11, "setLayoutMargins:", v75, v76, v67, v68);
        objc_msgSend(v11, "setContentInsets:", v72, v71, v74, v73);
        objc_msgSend(v11, "setBackgroundViewFrame:", v76 + 0.0 - v79, v75 + 0.0 - v77, v47, v48);
        objc_msgSend(v11, "setBorderInsets:", v77, v79, v78, v80);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "frame");
          v50 = v71 + a5.x + v49;
          objc_msgSend(v11, "frame");
          v52 = v72 + a5.y + v51;
          objc_msgSend(v11, "layoutBlueprint");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXLayoutFinalizationProcessor finalizeLayoutBlueprint:origin:absoluteOrigin:](self, "finalizeLayoutBlueprint:origin:absoluteOrigin:", v53, v42, v41, v50, v52);

        }
        v54 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v11, "componentSizer");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "infoForRendering");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "dictionaryWithDictionary:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "setObject:forKey:", v17, CFSTR("unitConverter"));
        objc_msgSend(v11, "storeInformationForRenderingPhase:", v57);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
    }
    while (v8);
  }

}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
}

@end
