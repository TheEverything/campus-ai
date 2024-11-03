import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'questions_model.dart';
export 'questions_model.dart';

class QuestionsWidget extends StatefulWidget {
  const QuestionsWidget({super.key});

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  late QuestionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/blur_bg@1x.png',
                ).image,
              ),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 770.0,
                ),
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                Container(
                                  width: 100.0,
                                  height: 24.0,
                                  decoration: const BoxDecoration(),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 80.0,
                                      height: 60.0,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'CampusAI',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('Home');
                                      },
                                      text: 'Ana Sayfa',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5.0,
                                        sigmaY: 4.0,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .overlay,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MarkdownBody(
                                                  data:
                                                      '''## Fen-Edebiyat Fakültesi:\n- MAT 261/E dersine kimler kayıt yaptırabilir?\n- Matematik bölümü ders kontenjanları nasıl belirlenir?\n\n\n## Gemi İnşaatı ve Deniz Bilimleri Fakültesi:\n- Öğretim üyelerinin iletişim bilgilerine nasıl ulaşabilirim?\n\n\n## İnşaat Fakültesi:\n- Staj defterimi teslim ederken hangi hususlara dikkat etmeliyim?\n- Yapı denetim firmasında yapılan staj hangi staj türüne girer?\n\n\n## Öğrenci İşleri ile İlgili Sorular:\n- Bir dersten danışman onayı ile çekildiğimde bu not ortalamama nasıl yansır?\n- Yaz okulunda her ders açılır mı?\n- Staj tarihlerini nasıl değiştirebilirim?\n- Erasmus programına ne zaman ve nasıl başvurabilirim?\n\n\n## Bölüm Sekreterliği ile İlgili Sorular:\n- Bitirme Tasarım Projesi sınav sonuçlarını nereden öğrenebilirim?\n- Öğretim üyelerinin haftalık ders programlarını nasıl öğrenebilirim?\n- Bitirme Tasarım Projesi sunum ve teslim tarihlerini nereden öğrenebilirim?\n\n\n## Diğer İdari İşlemlerle İlgili Sorular:\n- Binada elektrik kesilirse ne yapmalıyım?\n- Derslikteki çalışmayan projeksiyon cihazı için kime bilgi vermeliyim?\n\n\n## PIN Kodları ve Kampüs Dışı Erişim:\n- PIN kodunu nasıl alabilirim?\n- Kampüs Dışı Erişim hizmetinden kimler yararlanabilir?\n\n\n## Kütüphane Üyeliği ve Hizmetleri:\n- Sözleşmeli olarak çalışıyorum, kütüphaneye üye olabilir miyim?\n\n\n## Genel Bilgilendirme:\n- İTÜ\'de yarı zamanlı çalışarak ne kadar kazanabilirim?\n- PIN işlemleri için nereye başvurmalıyım?\n- İTÜ yurtlarının giriş saatleri nedir?\n\n\n## Yurtlar ve Barınma:\n- İTÜ yurtlarında arkadaşımı misafir edebilir miyim?\n\n\n## Maddi Destek ve Burslar:\n- Maddi destek talebimi nereye yapmalıyım?\n- İTÜ yemek bursu hakkında bilgi verebilir misiniz?\n- İTÜ başarı ya da gereksinim bursu alan öğrenciler yurtlarda burslu kalabilir mi?\n\n\n## Yemek Hizmetleri:\n- Yemekhanede neden daha az sebze yemeği çıkıyor?\n- İTÜ yemekhanelerinde akşam yemeği servisi var mı?\n\n\n## Yarı Zamanlı Çalışma:\n- Hangi birimlerde yarı zamanlı çalışabilirim?\n- Yarı zamanlı çalışmak ailemden aldığım hakları etkiler mi?\n- Başvuruya eklemem gereken belgeler nelerdir?''',
                                                  selectable: true,
                                                  onTapLink: (_, url, __) =>
                                                      launchURL(url!),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
                        width: 100.0,
                        height: 60.0,
                        decoration: const BoxDecoration(),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
