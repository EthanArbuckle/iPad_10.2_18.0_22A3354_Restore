@implementation _PIParallaxLayerStackDebugImageCollector

- (void)prepareImagesForItem:(id)a3 renderer:(id)a4 layout:(id)a5 style:(id)a6 inputImage:(id)a7 matteImage:(id)a8 infillImage:(id)a9 foregroundImage:(id)a10 backgroundImage:(id)a11
{
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  unint64_t v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  uint64_t v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  double v139;
  void *v140;
  double v141;
  void *v142;
  double v143;
  void *v144;
  id v145;
  void *v146;
  id v148;
  id v149;
  id v150;
  id v151;
  double v152;
  id v153;
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  id v159;
  id v160;
  _BYTE v161[128];
  _QWORD v162[2];
  _QWORD v163[4];

  v163[2] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v154 = a5;
  v150 = a6;
  v151 = a7;
  v145 = a8;
  v149 = a9;
  v148 = a10;
  v18 = v16;
  v19 = a11;
  objc_msgSend(v16, "regions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "faceRegions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferredCropRect");
  v152 = v22;
  v141 = v24;
  v143 = v23;
  v139 = v25;
  objc_msgSend(v20, "acceptableCropRect");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v20, "gazeAreaRect");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  objc_msgSend(v16, "settlingEffectNormalizedBounds");
  +[PISegmentationHelper debugImageWithInputImage:layout:faceRects:saliencyPreferrectRect:saliencyAcceptableRect:gazeAreaRect:settlingEffectRect:](PISegmentationHelper, "debugImageWithInputImage:layout:faceRects:saliencyPreferrectRect:saliencyAcceptableRect:gazeAreaRect:settlingEffectRect:", v151, v154, v21, v152, v143, v141, v139, v27, v29, v31, v33, v35, v37, v39, v41, v42, v43,
    v44,
    v45);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v160 = 0;
  v142 = v19;
  v46 = (void *)objc_msgSend(v17, "newRenderedPixelBufferFromImage:hasAlpha:error:", v19, 0, &v160);
  v47 = v160;
  -[_PIParallaxLayerStackDebugImageCollector setFlattenedBackgroundForDebugPreview:](self, "setFlattenedBackgroundForDebugPreview:", v46);

  v48 = (void *)MEMORY[0x1E0C9DDC8];
  -[_PIParallaxLayerStackDebugImageCollector flattenedBackgroundForDebugPreview](self, "flattenedBackgroundForDebugPreview");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "imageWithNUImageBuffer:", v49);
  v50 = objc_claimAutoreleasedReturnValue();

  v159 = 0;
  v144 = v17;
  v51 = (void *)objc_msgSend(v17, "newRenderedPixelBufferFromImage:hasAlpha:error:", v148, 1, &v159);
  v137 = v159;

  -[_PIParallaxLayerStackDebugImageCollector setFlattenedForegroundForDebugPreview:](self, "setFlattenedForegroundForDebugPreview:", v51);
  v52 = (void *)MEMORY[0x1E0C9DDC8];
  v53 = v18;
  -[_PIParallaxLayerStackDebugImageCollector flattenedForegroundForDebugPreview](self, "flattenedForegroundForDebugPreview");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "imageWithCVPixelBuffer:", objc_msgSend(v54, "CVPixelBuffer"));
  v55 = objc_claimAutoreleasedReturnValue();

  v138 = (void *)v50;
  v136 = (void *)v55;
  +[PISegmentationHelper debugPreviewRenderWithBackground:foreground:layout:style:](PISegmentationHelper, "debugPreviewRenderWithBackground:foreground:layout:style:", v50, v55, v154, v150);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorAnalysis");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "visibleFrame");
  +[PISegmentationHelper debugImageForColorAnalysis:inputImage:visibleFrame:](PISegmentationHelper, "debugImageForColorAnalysis:inputImage:visibleFrame:", v56, v151);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "segmentationConfidenceMap");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v58 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(v18, "segmentationConfidenceMap");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "imageWithNUImageBuffer:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(objc_msgSend(v18, "classification") - 3) <= 1)
    {
      +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", v60);
      v61 = objc_claimAutoreleasedReturnValue();

      v60 = (void *)v61;
    }
  }
  else
  {
    v60 = 0;
  }
  v153 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_msgSend(v18, "originalLayout");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "portraitLayout");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "debugLayouts");
  v65 = objc_claimAutoreleasedReturnValue();
  v133 = v60;
  if (!v65)
    goto LABEL_8;
  v66 = (void *)v65;
  v130 = v62;
  objc_msgSend(v53, "originalLayout");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "portraitLayout");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "debugLayouts");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "count");

  if (v70)
  {
    objc_msgSend(v53, "originalLayout");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "portraitLayout");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "debugLayouts");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "firstObject");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v163[0] = v71;
    objc_msgSend(v53, "originalLayout");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "portraitLayout");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "debugLayouts");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "lastObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v163[1] = v75;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 2);
    v126 = objc_claimAutoreleasedReturnValue();

    v62 = (id)v126;
LABEL_8:

    goto LABEL_10;
  }
  v62 = v130;
LABEL_10:
  objc_msgSend(v53, "originalLayout");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "landscapeLayout");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "debugLayouts");
  v78 = objc_claimAutoreleasedReturnValue();
  if (!v78)
  {
LABEL_13:
    v90 = 0x1E0C9D000;

    goto LABEL_15;
  }
  v79 = (void *)v78;
  v80 = v62;
  objc_msgSend(v53, "originalLayout");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "landscapeLayout");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "debugLayouts");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "count");

  if (v84)
  {
    objc_msgSend(v53, "originalLayout");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "landscapeLayout");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "debugLayouts");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "firstObject");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v162[0] = v129;
    objc_msgSend(v53, "originalLayout");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "landscapeLayout");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "debugLayouts");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "lastObject");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v162[1] = v88;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 2);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "arrayByAddingObjectsFromArray:", v89);
    v127 = objc_claimAutoreleasedReturnValue();

    v62 = (id)v127;
    goto LABEL_13;
  }
  v90 = 0x1E0C9D000uLL;
  v62 = v80;
LABEL_15:
  v91 = v53;
  v92 = v145;
  v93 = v92;
  if (!v92)
  {
    objc_msgSend(*(id *)(v90 + 3528), "blackImage");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "extent");
    objc_msgSend(v94, "imageByCroppingToRect:");
    v93 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v146 = v92;
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v95 = v62;
  v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v155, v161, 16);
  if (v96)
  {
    v97 = v96;
    v98 = *(_QWORD *)v156;
    do
    {
      for (i = 0; i != v97; ++i)
      {
        if (*(_QWORD *)v156 != v98)
          objc_enumerationMutation(v95);
        v100 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i);
        if (v100)
        {
          objc_msgSend(v20, "faceRegions");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "preferredCropRect");
          v103 = v102;
          v105 = v104;
          v107 = v106;
          v109 = v108;
          objc_msgSend(v20, "acceptableCropRect");
          v111 = v110;
          v113 = v112;
          v115 = v114;
          v117 = v116;
          objc_msgSend(v91, "settlingEffectNormalizedBounds");
          +[PISegmentationHelper debugImageWithInputImage:finalLayout:intermediateLayout:faceRects:saliencyPreferrectRect:saliencyAcceptableRect:settlingEffectRect:](PISegmentationHelper, "debugImageWithInputImage:finalLayout:intermediateLayout:faceRects:saliencyPreferrectRect:saliencyAcceptableRect:settlingEffectRect:", v93, v154, v100, v101, v103, v105, v107, v109, v111, v113, v115, v117, v118, v119, v120, v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v153, "addObject:", v122);
        }
      }
      v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v155, v161, 16);
    }
    while (v97);
  }

  objc_msgSend(v154, "visibleFrame");
  objc_msgSend(v154, "imageSize");
  objc_msgSend(v154, "imageSize");
  NURectNormalize();
  objc_msgSend(v146, "extent");
  NURectDenormalize();
  objc_msgSend(v146, "imageByCroppingToRect:");
  v123 = objc_claimAutoreleasedReturnValue();
  -[_PIParallaxLayerStackDebugImageCollector setDebugInputImage:](self, "setDebugInputImage:", v151);
  -[_PIParallaxLayerStackDebugImageCollector setDebugMatteImage:](self, "setDebugMatteImage:", v146);
  v132 = (void *)v123;
  -[_PIParallaxLayerStackDebugImageCollector setDebugMatteCropImage:](self, "setDebugMatteCropImage:", v123);
  if (v146)
  {
    +[PISegmentationHelper localConfidenceImage:](PISegmentationHelper, "localConfidenceImage:", v146);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector setDebugLocalConfidenceImage:](self, "setDebugLocalConfidenceImage:", v124);

  }
  else
  {
    -[_PIParallaxLayerStackDebugImageCollector setDebugLocalConfidenceImage:](self, "setDebugLocalConfidenceImage:", 0);
  }
  -[_PIParallaxLayerStackDebugImageCollector setDebugConfidenceMapImage:](self, "setDebugConfidenceMapImage:", v133);
  -[_PIParallaxLayerStackDebugImageCollector setDebugInfillImage:](self, "setDebugInfillImage:", v149);
  -[_PIParallaxLayerStackDebugImageCollector setDebugLayoutImage:](self, "setDebugLayoutImage:", v140);
  -[_PIParallaxLayerStackDebugImageCollector setDebugPreviewImage:](self, "setDebugPreviewImage:", v135);
  -[_PIParallaxLayerStackDebugImageCollector setDebugColorAnalysisImage:](self, "setDebugColorAnalysisImage:", v134);
  v125 = (void *)objc_msgSend(v153, "copy");
  -[_PIParallaxLayerStackDebugImageCollector setDebugIntermediateLayoutImages:](self, "setDebugIntermediateLayoutImages:", v125);

}

- (void)renderImagesWithRenderer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PIParallaxLayerStackDebugImageCollector debugInputImage](self, "debugInputImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugInputImage](self, "debugInputImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v7 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v6, 0, &v64);
    v5 = v64;
    -[_PIParallaxLayerStackDebugImageCollector setDebugInputBuffer:](self, "setDebugInputBuffer:", v7);

  }
  -[_PIParallaxLayerStackDebugImageCollector debugMatteImage](self, "debugMatteImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugMatteImage](self, "debugMatteImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v10 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v9, 0, &v63);
    v11 = v63;

    -[_PIParallaxLayerStackDebugImageCollector setDebugMatteBuffer:](self, "setDebugMatteBuffer:", v10);
    v5 = v11;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugMatteCropImage](self, "debugMatteCropImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugMatteCropImage](self, "debugMatteCropImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v14 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v13, 0, &v62);
    v15 = v62;

    -[_PIParallaxLayerStackDebugImageCollector setDebugMatteCropBuffer:](self, "setDebugMatteCropBuffer:", v14);
    v5 = v15;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugLocalConfidenceImage](self, "debugLocalConfidenceImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugLocalConfidenceImage](self, "debugLocalConfidenceImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v18 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v17, 0, &v61);
    v19 = v61;

    -[_PIParallaxLayerStackDebugImageCollector setDebugLocalConfidenceBuffer:](self, "setDebugLocalConfidenceBuffer:", v18);
    v5 = v19;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugConfidenceMapImage](self, "debugConfidenceMapImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugConfidenceMapImage](self, "debugConfidenceMapImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    v22 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v21, 0, &v60);
    v23 = v60;

    -[_PIParallaxLayerStackDebugImageCollector setDebugConfidenceMapBuffer:](self, "setDebugConfidenceMapBuffer:", v22);
    v5 = v23;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugInfillImage](self, "debugInfillImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugInfillImage](self, "debugInfillImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v26 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v25, 0, &v59);
    v27 = v59;

    -[_PIParallaxLayerStackDebugImageCollector setDebugInfillBuffer:](self, "setDebugInfillBuffer:", v26);
    v5 = v27;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugLayoutImage](self, "debugLayoutImage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugLayoutImage](self, "debugLayoutImage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v30 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v29, 0, &v58);
    v31 = v58;

    -[_PIParallaxLayerStackDebugImageCollector setDebugLayoutBuffer:](self, "setDebugLayoutBuffer:", v30);
    v5 = v31;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugPreviewImage](self, "debugPreviewImage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugPreviewImage](self, "debugPreviewImage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v34 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v33, 0, &v57);
    v35 = v57;

    -[_PIParallaxLayerStackDebugImageCollector setDebugPreviewBuffer:](self, "setDebugPreviewBuffer:", v34);
    v5 = v35;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugColorAnalysisImage](self, "debugColorAnalysisImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugColorAnalysisImage](self, "debugColorAnalysisImage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v38 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v37, 0, &v56);
    v39 = v56;

    -[_PIParallaxLayerStackDebugImageCollector setDebugColorAnalysisBuffer:](self, "setDebugColorAnalysisBuffer:", v38);
    v5 = v39;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugIntermediateLayoutImages](self, "debugIntermediateLayoutImages");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    -[_PIParallaxLayerStackDebugImageCollector debugIntermediateLayoutImages](self, "debugIntermediateLayoutImages");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v53;
      do
      {
        v46 = 0;
        v47 = v5;
        do
        {
          if (*(_QWORD *)v53 != v45)
            objc_enumerationMutation(v42);
          v48 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v46);
          v51 = 0;
          v49 = (void *)objc_msgSend(v4, "newRenderedPixelBufferFromImage:hasAlpha:error:", v48, 0, &v51);
          v5 = v51;

          objc_msgSend(v41, "addObject:", v49);
          ++v46;
          v47 = v5;
        }
        while (v44 != v46);
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
      }
      while (v44);
    }

    v50 = (void *)objc_msgSend(v41, "copy");
    -[_PIParallaxLayerStackDebugImageCollector setDebugIntermediateLayoutBuffers:](self, "setDebugIntermediateLayoutBuffers:", v50);

  }
}

- (id)resultLayersWithRenderer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  unint64_t v56;
  id v58;

  v4 = a3;
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_PIParallaxLayerStackDebugImageCollector debugInputBuffer](self, "debugInputBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugInputBuffer](self, "debugInputBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugInputImage](self, "debugInputImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v6, v7, CFSTR("debugInput"), -100.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v58, "addObject:", v8);

    v9 = -101;
  }
  else
  {
    v9 = -100;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugMatteBuffer](self, "debugMatteBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugMatteBuffer](self, "debugMatteBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugMatteImage](self, "debugMatteImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v11, v12, CFSTR("debugMatte"), (double)v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v58, "addObject:", v13);

    --v9;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugMatteCropBuffer](self, "debugMatteCropBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugMatteCropBuffer](self, "debugMatteCropBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugMatteCropImage](self, "debugMatteCropImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v15, v16, CFSTR("debugMatteCrop"), (double)v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v58, "addObject:", v17);

    --v9;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugLocalConfidenceBuffer](self, "debugLocalConfidenceBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugLocalConfidenceBuffer](self, "debugLocalConfidenceBuffer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugLocalConfidenceImage](self, "debugLocalConfidenceImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v19, v20, CFSTR("debugLocalConfidence"), (double)v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v58, "addObject:", v21);

    --v9;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugConfidenceMapBuffer](self, "debugConfidenceMapBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugConfidenceMapBuffer](self, "debugConfidenceMapBuffer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugConfidenceMapImage](self, "debugConfidenceMapImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v23, v24, CFSTR("debugConfidenceMap"), (double)v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      objc_msgSend(v58, "addObject:", v25);

    --v9;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugInfillBuffer](self, "debugInfillBuffer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugInfillBuffer](self, "debugInfillBuffer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugInfillImage](self, "debugInfillImage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v27, v28, CFSTR("debugInfill"), (double)v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      objc_msgSend(v58, "addObject:", v29);

    --v9;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugLayoutBuffer](self, "debugLayoutBuffer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugLayoutBuffer](self, "debugLayoutBuffer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugLayoutImage](self, "debugLayoutImage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v31, v32, CFSTR("debugLayout"), (double)v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
      objc_msgSend(v58, "addObject:", v33);

    --v9;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugPreviewBuffer](self, "debugPreviewBuffer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugPreviewBuffer](self, "debugPreviewBuffer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugPreviewImage](self, "debugPreviewImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v35, v36, CFSTR("debugPreview"), (double)v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      objc_msgSend(v58, "addObject:", v37);

    --v9;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugColorAnalysisBuffer](self, "debugColorAnalysisBuffer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugColorAnalysisBuffer](self, "debugColorAnalysisBuffer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PIParallaxLayerStackDebugImageCollector debugColorAnalysisImage](self, "debugColorAnalysisImage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v39, v40, CFSTR("debugColorAnalysis"), (double)v9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      objc_msgSend(v58, "addObject:", v41);

    --v9;
  }
  -[_PIParallaxLayerStackDebugImageCollector debugIntermediateLayoutBuffers](self, "debugIntermediateLayoutBuffers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  if (v43)
  {
    -[_PIParallaxLayerStackDebugImageCollector debugIntermediateLayoutBuffers](self, "debugIntermediateLayoutBuffers");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "count");

    if (v45)
    {
      v46 = 0;
      v47 = (double)v9 + -8.0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("debugLayoutIntermediate_%d"), v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PIParallaxLayerStackDebugImageCollector debugIntermediateLayoutBuffers](self, "debugIntermediateLayoutBuffers");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndexedSubscript:", v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PIParallaxLayerStackDebugImageCollector debugIntermediateLayoutImages](self, "debugIntermediateLayoutImages");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectAtIndexedSubscript:", v46);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v4;
        objc_msgSend(v4, "layerForBuffer:image:zPosition:identifier:", v50, v52, v48, v47);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
          objc_msgSend(v58, "addObject:", v54);

        ++v46;
        -[_PIParallaxLayerStackDebugImageCollector debugIntermediateLayoutBuffers](self, "debugIntermediateLayoutBuffers");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "count");

        v4 = v53;
      }
      while (v46 < v56);
    }
  }

  return v58;
}

- (CIImage)debugInputImage
{
  return self->_debugInputImage;
}

- (void)setDebugInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugInputImage, a3);
}

- (CIImage)debugMatteImage
{
  return self->_debugMatteImage;
}

- (void)setDebugMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugMatteImage, a3);
}

- (CIImage)debugMatteCropImage
{
  return self->_debugMatteCropImage;
}

- (void)setDebugMatteCropImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugMatteCropImage, a3);
}

- (CIImage)debugLocalConfidenceImage
{
  return self->_debugLocalConfidenceImage;
}

- (void)setDebugLocalConfidenceImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugLocalConfidenceImage, a3);
}

- (CIImage)debugConfidenceMapImage
{
  return self->_debugConfidenceMapImage;
}

- (void)setDebugConfidenceMapImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugConfidenceMapImage, a3);
}

- (CIImage)debugInfillImage
{
  return self->_debugInfillImage;
}

- (void)setDebugInfillImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfillImage, a3);
}

- (CIImage)debugLayoutImage
{
  return self->_debugLayoutImage;
}

- (void)setDebugLayoutImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugLayoutImage, a3);
}

- (NSArray)debugIntermediateLayoutImages
{
  return self->_debugIntermediateLayoutImages;
}

- (void)setDebugIntermediateLayoutImages:(id)a3
{
  objc_storeStrong((id *)&self->_debugIntermediateLayoutImages, a3);
}

- (CIImage)debugPreviewImage
{
  return self->_debugPreviewImage;
}

- (void)setDebugPreviewImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugPreviewImage, a3);
}

- (CIImage)debugColorAnalysisImage
{
  return self->_debugColorAnalysisImage;
}

- (void)setDebugColorAnalysisImage:(id)a3
{
  objc_storeStrong((id *)&self->_debugColorAnalysisImage, a3);
}

- (NUImageBuffer)debugInputBuffer
{
  return self->_debugInputBuffer;
}

- (void)setDebugInputBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugInputBuffer, a3);
}

- (NUImageBuffer)debugMatteBuffer
{
  return self->_debugMatteBuffer;
}

- (void)setDebugMatteBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugMatteBuffer, a3);
}

- (NUImageBuffer)debugMatteCropBuffer
{
  return self->_debugMatteCropBuffer;
}

- (void)setDebugMatteCropBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugMatteCropBuffer, a3);
}

- (NUImageBuffer)debugLocalConfidenceBuffer
{
  return self->_debugLocalConfidenceBuffer;
}

- (void)setDebugLocalConfidenceBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugLocalConfidenceBuffer, a3);
}

- (NUImageBuffer)debugConfidenceMapBuffer
{
  return self->_debugConfidenceMapBuffer;
}

- (void)setDebugConfidenceMapBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugConfidenceMapBuffer, a3);
}

- (NUImageBuffer)debugInfillBuffer
{
  return self->_debugInfillBuffer;
}

- (void)setDebugInfillBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfillBuffer, a3);
}

- (NUImageBuffer)debugLayoutBuffer
{
  return self->_debugLayoutBuffer;
}

- (void)setDebugLayoutBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugLayoutBuffer, a3);
}

- (NSArray)debugIntermediateLayoutBuffers
{
  return self->_debugIntermediateLayoutBuffers;
}

- (void)setDebugIntermediateLayoutBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_debugIntermediateLayoutBuffers, a3);
}

- (NUImageBuffer)debugPreviewBuffer
{
  return self->_debugPreviewBuffer;
}

- (void)setDebugPreviewBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugPreviewBuffer, a3);
}

- (NUImageBuffer)debugColorAnalysisBuffer
{
  return self->_debugColorAnalysisBuffer;
}

- (void)setDebugColorAnalysisBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_debugColorAnalysisBuffer, a3);
}

- (NUImageBuffer)flattenedBackgroundForDebugPreview
{
  return self->_flattenedBackgroundForDebugPreview;
}

- (void)setFlattenedBackgroundForDebugPreview:(id)a3
{
  objc_storeStrong((id *)&self->_flattenedBackgroundForDebugPreview, a3);
}

- (NUImageBuffer)flattenedForegroundForDebugPreview
{
  return self->_flattenedForegroundForDebugPreview;
}

- (void)setFlattenedForegroundForDebugPreview:(id)a3
{
  objc_storeStrong((id *)&self->_flattenedForegroundForDebugPreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flattenedForegroundForDebugPreview, 0);
  objc_storeStrong((id *)&self->_flattenedBackgroundForDebugPreview, 0);
  objc_storeStrong((id *)&self->_debugColorAnalysisBuffer, 0);
  objc_storeStrong((id *)&self->_debugPreviewBuffer, 0);
  objc_storeStrong((id *)&self->_debugIntermediateLayoutBuffers, 0);
  objc_storeStrong((id *)&self->_debugLayoutBuffer, 0);
  objc_storeStrong((id *)&self->_debugInfillBuffer, 0);
  objc_storeStrong((id *)&self->_debugConfidenceMapBuffer, 0);
  objc_storeStrong((id *)&self->_debugLocalConfidenceBuffer, 0);
  objc_storeStrong((id *)&self->_debugMatteCropBuffer, 0);
  objc_storeStrong((id *)&self->_debugMatteBuffer, 0);
  objc_storeStrong((id *)&self->_debugInputBuffer, 0);
  objc_storeStrong((id *)&self->_debugColorAnalysisImage, 0);
  objc_storeStrong((id *)&self->_debugPreviewImage, 0);
  objc_storeStrong((id *)&self->_debugIntermediateLayoutImages, 0);
  objc_storeStrong((id *)&self->_debugLayoutImage, 0);
  objc_storeStrong((id *)&self->_debugInfillImage, 0);
  objc_storeStrong((id *)&self->_debugConfidenceMapImage, 0);
  objc_storeStrong((id *)&self->_debugLocalConfidenceImage, 0);
  objc_storeStrong((id *)&self->_debugMatteCropImage, 0);
  objc_storeStrong((id *)&self->_debugMatteImage, 0);
  objc_storeStrong((id *)&self->_debugInputImage, 0);
}

@end
