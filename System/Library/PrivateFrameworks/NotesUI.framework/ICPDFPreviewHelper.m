@implementation ICPDFPreviewHelper

+ (BOOL)drawPreviewOfPDFDocument:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  CGContext *CurrentContext;
  NSObject *v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  NSObject *v22;
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
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "pageAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICPDFPreviewHelper drawPreviewOfPDFDocument:inRect:].cold.1(v11, v30, v31, v32, v33, v34, v35, v36);
    goto LABEL_13;
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v8, "thumbnailOfSize:forBox:", 1, width, height);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10
    || (-[NSObject size](v10, "size"), v12 <= 0.0)
    || (-[NSObject size](v11, "size"), v13 <= 0.0)
    || width <= 0.0
    || height <= 0.0)
  {
    v22 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[ICPDFPreviewHelper drawPreviewOfPDFDocument:inRect:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  -[NSObject size](v11, "size");
  v15 = v14;
  -[NSObject size](v11, "size");
  v38.size.height = width / (v15 / v16);
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = width;
  v39 = CGRectOffset(v38, x, y);
  v17 = v39.origin.x;
  v18 = v39.origin.y;
  v19 = v39.size.width;
  v20 = v39.size.height;
  CGContextSaveGState(CurrentContext);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  CGContextClipToRect(CurrentContext, v40);
  -[NSObject drawInRect:](v11, "drawInRect:", v17, v18, v19, v20);
  CGContextRestoreGState(CurrentContext);
  v21 = 1;
LABEL_14:

  return v21;
}

+ (void)drawPreviewOfPDFDocument:(uint64_t)a3 inRect:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "PDF document didn't have a first page for attachment", a5, a6, a7, a8, 0);
}

+ (void)drawPreviewOfPDFDocument:(uint64_t)a3 inRect:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "Generated preview image for paper bundle attachment was invalid", a5, a6, a7, a8, 0);
}

@end
