* Parte 1 - Exercício 3
" Ler uma data em formato DD/MM/AAAA e imprimir no formato DD de MMMM de AAAA. Exemplo: 15/01/2016 -> 15 de Janeiro de 2016.

REPORT zrgsf_p1ex3.

PARAMETERS p_date TYPE d.

DATA: lv_dia(2) TYPE c,
      lv_mes(2) TYPE c,
      lv_ano(4) TYPE c,
      lv_mesext TYPE string.

lv_dia = p_date+6(2). "Selecionando do indice 6-7, pegando 2 numeros (dia).
lv_mes = p_date+4(2). "Selecionando do indice 4-5, pegando 2 numeros (mes).
lv_ano = p_date+0(4). "Selecionando do infice 0-1-2-3, pegando 4 numeros (ano).

START-OF-SELECTION.

  PERFORM zf_tratamento.
  PERFORM zf_exibe.

END-OF-SELECTION.

FORM zf_tratamento.

  CASE lv_mes.
    WHEN '01'.
      lv_mesext = 'Janeiro'.
    WHEN '02'.
      lv_mesext = 'Fevereiro'.
    WHEN '03'.
      lv_mesext = 'Março'.
    WHEN '04'.
      lv_mesext = 'Abril'.
    WHEN '05'.
      lv_mesext = 'Maio'.
    WHEN '06'.
      lv_mesext = 'Junho'.
    WHEN '07'.
      lv_mesext = 'Julho'.
    WHEN '08'.
      lv_mesext = 'Agosto'.
    WHEN '09'.
      lv_mesext = 'Setembro'.
    WHEN '10'.
      lv_mesext = 'Outubro'.
    WHEN '11'.
      lv_mesext = 'Novembro'.
    WHEN '12'.
      lv_mesext = 'Dezembro'.
  ENDCASE.

ENDFORM.

FORM zf_exibe.

WRITE | { lv_dia } de { lv_mesext } de { lv_ano }|.

ENDFORM.
