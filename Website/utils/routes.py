
simple_page = Blueprint('simple_page', __name__, template_folder='templates')
@simple_page.route('/<page>')
def show(page):
  klanten = get_all_klanten()
  return render_template("klanten.html", klanten=klanten)
