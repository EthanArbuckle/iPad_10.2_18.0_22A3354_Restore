@implementation CRLUtilityAccessibilityValidator

+ (void)performPlatformSpecificValidations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLColor"), CFSTR("UIColor"), "@", v2, v3, v4, v5, v6, 0);
  __CRLAccessibilityValidateClass(CFSTR("CRLColor"));
}

+ (void)performValidations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("isCircular"), "B", v2, v3, v4, v5, v6, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("isDiamond"), "B", v7, v8, v9, v10, v11, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("isLineSegment"), "B", v12, v13, v14, v15, v16, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("isRectangular"), "B", v17, v18, v19, v20, v21, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("isTriangular"), "B", v22, v23, v24, v25, v26, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("elementCount"), "q", v27, v28, v29, v30, v31, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("isFlat"), "B", v32, v33, v34, v35, v36, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("elementAtIndex:"), "q", v37, v38, v39, v40, v41, "q");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLBezierPath"), CFSTR("elementAtIndex:associatedPoints:"), "q", v42, v43, v44, v45, v46, "q");
  __CRLAccessibilityValidateClassMethodComplete(CFSTR("CRLColor"), CFSTR("colorWithHue:saturation:brightness:alpha:"), "@", v47, v48, v49, v50, v51, "d");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLColor"), CFSTR("redComponent"), "d", v52, v53, v54, v55, v56, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLColor"), CFSTR("blueComponent"), "d", v57, v58, v59, v60, v61, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLColor"), CFSTR("greenComponent"), "d", v62, v63, v64, v65, v66, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLColor"), CFSTR("alphaComponent"), "d", v67, v68, v69, v70, v71, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLColor"), CFSTR("hueComponent"), "d", v72, v73, v74, v75, v76, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLColor"), CFSTR("saturationComponent"), "d", v77, v78, v79, v80, v81, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLColor"), CFSTR("getRGBAComponents:"), "v", v82, v83, v84, v85, v86, "^d");
  __CRLAccessibilityValidateInstanceMethodComplete(CFSTR("CRLImage"), CFSTR("size"), "{CGSize=dd}", v87, v88, v89, v90, v91, 0);
}

@end
